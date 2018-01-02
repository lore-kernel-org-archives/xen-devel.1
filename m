From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/xen/time: fix section mismatch for
 xen_init_time_ops()
Date: Tue, 2 Jan 2018 14:32:17 +0000
Message-ID: <87e3dc74-5959-1ecf-6854-fda017c2c775__17573.3067015701$1514903496$gmane$org@citrix.com>
References: <1514083813-27047-1-git-send-email-nick.desaulniers@gmail.com>
 <52b547c5-509a-3a82-12cd-4d9d0a06b53f@oracle.com>
 <d5314269-6d7e-d496-695f-af59bc41f554@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=fv3j=d5=citrix.com=prvs=5335d5e9d=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1eWNcA-00083f-My
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2018 14:32:26 +0000
In-Reply-To: <d5314269-6d7e-d496-695f-af59bc41f554@suse.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Nick Desaulniers <nick.desaulniers@gmail.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDEvMTggMTQ6MjQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMDIvMDEvMTggMTU6
MTgsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPj4gT24gMTIvMjMvMjAxNyAwOTo1MCBQTSwgTmlj
ayBEZXNhdWxuaWVycyB3cm90ZToKPj4+IFRoZSBoZWFkZXIgZGVjbGFyZXMgdGhpcyBmdW5jdGlv
biBhcyBfX2luaXQgYnV0IGlzIGRlZmluZWQgaW4gX19yZWYKPj4+IHNlY3Rpb24uCj4+Pgo+Pj4g
U2lnbmVkLW9mZi1ieTogTmljayBEZXNhdWxuaWVycyA8bmljay5kZXNhdWxuaWVyc0BnbWFpbC5j
b20+Cj4+IEFGQUlLIHNlY3Rpb24gYXR0cmlidXRlcyBpbiBoZWFkZXIgZmlsZXMgYXJlIGlnbm9y
ZWQgYnkgY29tcGlsZXIgYW55d2F5Cj4+IHNvIEknZCByZW1vdmUgYWxsIG9mIHRoZW0uCj4gSG1t
LCBJJ20gbm90IHN1cmUgYWxsIGZ1dHVyZSBjb21waWxlcnMgd2lsbCBpZ25vcmUgdGhlIHNlY3Rp
b24KPiBhdHRyaWJ1dGVzLiBpbmNsdWRlL2xpbnV4L2luaXQuaCBleHBsaWN0aWx5IG1lbnRpb25z
IHdoZXJlIHRvIHB1dAo+IHRoZSBhdHRydWJ1dGUgaW4gYSBwcm90b3R5cGUsIHNvIEknZCByYXRo
ZXIga2VlcCBpdC4KCkF0dHJpYnV0ZXMgaW4gdGhlIGRlY2xhcmF0aW9uIGFyZSBmb3Igc3RhdGlj
IGFuYWx5c2lzIHRvb2xzIHN1Y2ggYXMgc3BhcnNlLgoKSG93IGVsc2UgYXJlIHlvdSBnb2luZyB0
byB3b3JrIG91dCB3aGV0aGVyIGEgc2VjdGlvbiBtaXNtYXRjaCBoYXMgb2NjdXJyZWQ/Cgp+QW5k
cmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
