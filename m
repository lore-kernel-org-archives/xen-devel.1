From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] x86/xen/time: fix section mismatch for
 xen_init_time_ops()
Date: Tue, 2 Jan 2018 10:00:50 -0500
Message-ID: <6c82c574-6810-1003-183c-44f79ae7554f__42821.5013271712$1514905010$gmane$org@oracle.com>
References: <1514083813-27047-1-git-send-email-nick.desaulniers@gmail.com>
 <52b547c5-509a-3a82-12cd-4d9d0a06b53f@oracle.com>
 <d5314269-6d7e-d496-695f-af59bc41f554@suse.com>
 <87e3dc74-5959-1ecf-6854-fda017c2c775@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=swgl=d5=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1eWO0m-00019Z-Fw
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2018 14:57:52 +0000
In-Reply-To: <87e3dc74-5959-1ecf-6854-fda017c2c775@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>, Nick Desaulniers <nick.desaulniers@gmail.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDIvMjAxOCAwOTozMiBBTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwMi8wMS8x
OCAxNDoyNCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMDIvMDEvMTggMTU6MTgsIEJvcmlz
IE9zdHJvdnNreSB3cm90ZToKPj4+IE9uIDEyLzIzLzIwMTcgMDk6NTAgUE0sIE5pY2sgRGVzYXVs
bmllcnMgd3JvdGU6Cj4+Pj4gVGhlIGhlYWRlciBkZWNsYXJlcyB0aGlzIGZ1bmN0aW9uIGFzIF9f
aW5pdCBidXQgaXMgZGVmaW5lZCBpbiBfX3JlZgo+Pj4+IHNlY3Rpb24uCj4+Pj4KPj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBOaWNrIERlc2F1bG5pZXJzIDxuaWNrLmRlc2F1bG5pZXJzQGdtYWlsLmNvbT4K
Pj4+IEFGQUlLIHNlY3Rpb24gYXR0cmlidXRlcyBpbiBoZWFkZXIgZmlsZXMgYXJlIGlnbm9yZWQg
YnkgY29tcGlsZXIgYW55d2F5Cj4+PiBzbyBJJ2QgcmVtb3ZlIGFsbCBvZiB0aGVtLgo+PiBIbW0s
IEknbSBub3Qgc3VyZSBhbGwgZnV0dXJlIGNvbXBpbGVycyB3aWxsIGlnbm9yZSB0aGUgc2VjdGlv
bgo+PiBhdHRyaWJ1dGVzLiBpbmNsdWRlL2xpbnV4L2luaXQuaCBleHBsaWN0aWx5IG1lbnRpb25z
IHdoZXJlIHRvIHB1dAo+PiB0aGUgYXR0cnVidXRlIGluIGEgcHJvdG90eXBlLCBzbyBJJ2QgcmF0
aGVyIGtlZXAgaXQuCj4gQXR0cmlidXRlcyBpbiB0aGUgZGVjbGFyYXRpb24gYXJlIGZvciBzdGF0
aWMgYW5hbHlzaXMgdG9vbHMgc3VjaCBhcyBzcGFyc2UuCj4KPiBIb3cgZWxzZSBhcmUgeW91IGdv
aW5nIHRvIHdvcmsgb3V0IHdoZXRoZXIgYSBzZWN0aW9uIG1pc21hdGNoIGhhcyBvY2N1cnJlZD8K
Cklzbid0IHRoaXMgZG9uZSBiYXNlZCBvbiBkZWZpbml0aW9ucz8KClRvbnMgb2YgX19pbml0IHJv
dXRpbmVzIGRvbid0IGhhdmUgdGhlIGF0dHJpYnV0ZSBzcGVjaWZpZWQgaW4gaGVhZGVyCmZpbGVz
LiBJbiBmYWN0LCBldmVuIGluIHRoaXMgZmlsZSAoYXJjaC94ODYveGVuL3hlbi1vcHMuaCkgdGhl
cmUgYXJlCnNvbWUgdGhhdCBkb24ndCBoYXZlIGl0LgoKLWJvcmlzCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
