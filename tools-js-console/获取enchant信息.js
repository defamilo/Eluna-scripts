
function copyToClip1(content) {
    var aux = document.createElement("input");
    aux.setAttribute("value", content);
    document.body.appendChild(aux);
    aux.select();
    document.execCommand("copy");
    document.body.removeChild(aux);
    console.log("复制成功: " + content);
}

function printName(spid) {
    fetch(`https://80.wowfan.net/?enchantment=${spid}`, {
        "headers": {
            "accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7",
            "accept-language": "zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6",
            "cache-control": "max-age=0",
            "sec-ch-ua": "\"Chromium\";v=\"112\", \"Microsoft Edge\";v=\"112\", \"Not:A-Brand\";v=\"99\"",
            "sec-ch-ua-mobile": "?0",
            "sec-ch-ua-platform": "\"macOS\"",
            "sec-fetch-dest": "document",
            "sec-fetch-mode": "navigate",
            "sec-fetch-site": "none",
            "sec-fetch-user": "?1",
            "upgrade-insecure-requests": "1"
        },
        "referrerPolicy": "strict-origin-when-cross-origin",
        "body": null,
        "method": "GET",
        "mode": "cors",
        "credentials": "include"
    }).then(res => res.text()).then(res => {
        //var aa = /var _ = g_enchantments\; _\[(.+)\]=\{\"name_zhcn\":\"(.+)\"\}\;/
        var aa = /\<title\>(.+) - 附魔 - World of Waicraft\<\/title\>/
        var bb = res.match(aa)
        if (!bb || bb.length < 2) {
            console.log('解析错误！')
        } else {
            console.log('id=' + spid + ', 内容: ' + bb[1]);
            copyToClip1(bb[1]);
        }
    });

}
