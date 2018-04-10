From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 8/9] xen/x86: add some cr3 helpers
Date: Tue, 10 Apr 2018 03:19:12 -0600
Message-ID: <5ACC9DB002000078001B9D5D@prv1-mh.provo.novell.com>
References: <20180410075843.6822-1-jgross@suse.com>
 <20180410075843.6822-9-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ay0c=g7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f5pQq-00067Q-64
 for xen-devel@lists.xenproject.org; Tue, 10 Apr 2018 09:19:16 +0000
In-Reply-To: <20180410075843.6822-9-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjA0LjE4IGF0IDA5OjU4LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiAtLS0g
YS94ZW4vaW5jbHVkZS9hc20teDg2L3Byb2Nlc3Nvci5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNt
LXg4Ni9wcm9jZXNzb3IuaAo+IEBAIC0yODgsNiArMjg4LDE2IEBAIHN0YXRpYyBpbmxpbmUgdm9p
ZCB3cml0ZV9jcjModW5zaWduZWQgbG9uZyB2YWwpCj4gICAgICBhc20gdm9sYXRpbGUgKCAibW92
ICUwLCAlJWNyMyIgOiA6ICJyIiAodmFsKSA6ICJtZW1vcnkiICk7Cj4gIH0KPiAgCj4gK3N0YXRp
YyBpbmxpbmUgdW5zaWduZWQgbG9uZyBjcjNfcGEodW5zaWduZWQgbG9uZyBjcjMpCj4gK3sKPiAr
ICAgIHJldHVybiBjcjMgJiBYODZfQ1IzX0FERFJfTUFTSzsKPiArfQo+ICsKPiArc3RhdGljIGlu
bGluZSB1bnNpZ25lZCBsb25nIGNyM19wY2lkKHVuc2lnbmVkIGxvbmcgY3IzKQoKVGhpcyB3b3Vs
ZCBwZXJoYXBzIGJldHRlciByZXR1cm4gdW5zaWduZWQgaW50LCBidXQgYW55d2F5ClJldmlld2Vk
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
