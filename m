From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] x86/E820: don't overrun array
Date: Wed, 20 Dec 2017 19:28:10 +0000
Message-ID: <f1653072-d062-2325-fe72-a5eba4bba498@citrix.com>
References: <5A2FC3870200007800196BD4@prv-mh.provo.novell.com>
 <5A2FC71B0200007800196BFE@prv-mh.provo.novell.com>
 <784f9203-15aa-1188-91ea-a8230013b570@citrix.com>
 <5A2FF3E30200007800196DAB@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=4g8x=dq=citrix.com=prvs=520a8dc14=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1eRk2O-0001TU-HI
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2017 19:28:20 +0000
In-Reply-To: <5A2FF3E30200007800196DAB@prv-mh.provo.novell.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMTIvMTcgMTQ6MjEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDEyLjEyLjE3IGF0
IDEyOjE4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDEyLzEyLzE3
IDExOjEwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IFRoZSBib3VuZHMgY2hlY2sgbmVlZHMgdG8g
YmUgZG9uZSBhZnRlciB0aGUgaW5jcmVtZW50LCBub3QgYmVmb3JlLCBvcgo+Pj4gZWxzZSBpdCBu
ZWVkcyB0byB1c2UgYSBvbmUgbG93ZXIgaW1tZWRpYXRlLiBBbHNvIHVzZSB3b3JkIG9wZXJhdGlv
bnMKPj4+IHJhdGhlciB0aGFuIGJ5dGUgb25lcyBmb3IgYm90aCB0aGUgaW5jcmVtZW50IGFuZCB0
aGUgY29tcGFyZSAoYWxsb3dpbmcKPj4+IEU4MjBfQklPU19NQVggdG8gYmUgbW9yZSBlYXNpbHkg
YnVtcGVkLCBzaG91bGQgdGhlIG5lZWQgZXZlciBhcmlzZSkuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
