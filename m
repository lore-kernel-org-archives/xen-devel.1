From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/3] x86/pv: Introduce and use
 x86emul_write_dr()
Date: Fri, 13 Apr 2018 12:37:39 +0100
Message-ID: <3ce7dfa8-5682-27be-332a-de4458d34f48@citrix.com>
References: <1523552156-20866-1-git-send-email-andrew.cooper3@citrix.com>
 <1523552156-20866-3-git-send-email-andrew.cooper3@citrix.com>
 <5AD06CAC02000078001BAFAA@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5AD06CAC02000078001BAFAA@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTMvMDQvMTggMDk6MzksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDEyLjA0LjE4IGF0
IDE4OjU1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IEBAIC0yMDI5LDcg
KzIwMzUsMTcgQEAgbG9uZyBzZXRfZGVidWdyZWcoc3RydWN0IHZjcHUgKnYsIHVuc2lnbmVkIGlu
dCByZWcsIHVuc2lnbmVkIGxvbmcgdmFsdWUpCj4+ICAgICAgICAgIGlmICggdiA9PSBjdXJyICkK
Pj4gICAgICAgICAgICAgIHdyaXRlX2RlYnVncmVnKDMsIHZhbHVlKTsKPj4gICAgICAgICAgYnJl
YWs7Cj4+ICsKPj4gKyAgICBjYXNlIDQ6Cj4+ICsgICAgICAgIGlmICggdi0+YXJjaC5wdl92Y3B1
LmN0cmxyZWdbNF0gJiBYODZfQ1I0X0RFICkKPj4gKyAgICAgICAgICAgIHJldHVybiAtRU5PREVW
Owo+PiArCj4+ICsgICAgICAgIC8qIEZhbGx0aHJvdWdoICovCj4+ICAgICAgY2FzZSA2Ogo+PiAr
ICAgICAgICAvKiBUaGUgdXBwZXIgMzIgYml0cyBhcmUgc3RyaWN0bHkgcmVzZXJ2ZWQuICovCj4+
ICsgICAgICAgIGlmICggdmFsdWUgIT0gKHVpbnQzMl90KXZhbHVlICkKPj4gKyAgICAgICAgICAg
IHJldHVybiAtRUlOVkFMOwo+PiArCj4+ICAgICAgICAgIC8qCj4+ICAgICAgICAgICAqIERSNjog
Qml0cyA0LTExLDE2LTMxIHJlc2VydmVkIChzZXQgdG8gMSkuCj4+ICAgICAgICAgICAqICAgICAg
Qml0IDEyIHJlc2VydmVkIChzZXQgdG8gMCkuCj4gSG93IGFyZSB0aGUgdXBwZXIgMzIgYml0cyBk
aWZmZXJlbnQgZnJvbSB0aGUgb3RoZXIgcmVzZXJ2ZWQgYml0cyAobmFtZWQgaW4gdGhlCj4gY29t
bWVudCB2aXNpYmxlIGhlcmUpPwoKVGhlIHVwcGVyIDMyIGJpdHMgYXJlIE1CWiBhbmQgd2lsbCBy
YWlzZSAjR1AgaWYgc2V0LsKgIFRoZSBsb3dlciByZXNlcnZlZApiaXRzIGFyZSB3cml0ZS1pZ25v
cmVkLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
