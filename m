From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v5 15/47] x86emul: support AVX512{F,
 BW} packed integer arithmetic insns
Date: Mon, 19 Nov 2018 19:18:36 +0000
Message-ID: <8db675a5-5c97-daac-aa03-991776ccf998@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5BF289D802000078001FD3DF@prv1-mh.provo.novell.com>
 <5BF28EC102000078001FD4B4@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gnyi=n6=citrix.com=prvs=8544ffb4f=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gOp4C-00050M-0O
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 19:18:40 +0000
In-Reply-To: <5BF28EC102000078001FD4B4@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMTEvMjAxOCAxMDoyMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gTm90ZTogdnBhZGQqIC8g
dnBzdWIqIGV0IGFsIGFyZSBwdXQgYXQgc2VlbWluZ2x5IHRoZSB3cm9uZyBzbG90IG9mIHRoZQo+
IGJpZyBzd2l0Y2goKS4gVGhpcyBpcyBpbiBhbnRpY2lwYXRpb24gb2YgYWRkaW5nIGUuZy4gdnB1
bnBjayogdG8gdGhvc2UKPiBncm91cHMgKHNlZSB0aGUgbGVnYWN5L1ZFWCBlbmNvZGVkIGNhc2Ug
bGFiZWxzIG5lYXJieSB0byBzdXBwb3J0IHRoaXMpLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
