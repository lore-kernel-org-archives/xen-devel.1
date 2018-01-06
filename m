From: Nick Desaulniers <nick.desaulniers@gmail.com>
Subject: Re: [PATCH] x86/xen/time: fix section mismatch for
	xen_init_time_ops()
Date: Sat, 6 Jan 2018 12:35:45 -0800
Message-ID: <CAH7mPviNpb4Gtm95=D1n4L90NSUCJO2ihOvRGQuEBNEHFyZ8Zg@mail.gmail.com>
References: <1514083813-27047-1-git-send-email-nick.desaulniers@gmail.com>
 <52b547c5-509a-3a82-12cd-4d9d0a06b53f@oracle.com>
 <d5314269-6d7e-d496-695f-af59bc41f554@suse.com>
 <87e3dc74-5959-1ecf-6854-fda017c2c775@citrix.com>
 <6c82c574-6810-1003-183c-44f79ae7554f@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ognq=eb=gmail.com=nick.desaulniers@srs-us1.protection.inumbo.net>)
 id 1eXvC0-00051I-NL
 for xen-devel@lists.xenproject.org; Sat, 06 Jan 2018 20:35:48 +0000
Received: by mail-ot0-x243.google.com with SMTP id g59so6525851otg.11
 for <xen-devel@lists.xenproject.org>; Sat, 06 Jan 2018 12:35:47 -0800 (PST)
In-Reply-To: <6c82c574-6810-1003-183c-44f79ae7554f@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, x86@kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMiwgMjAxOCBhdCA3OjAwIEFNLCBCb3JpcyBPc3Ryb3Zza3kKPGJvcmlzLm9z
dHJvdnNreUBvcmFjbGUuY29tPiB3cm90ZToKPiBPbiAwMS8wMi8yMDE4IDA5OjMyIEFNLCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAwMi8wMS8xOCAxNDoyNCwgSnVlcmdlbiBHcm9zcyB3cm90
ZToKPj4+IE9uIDAyLzAxLzE4IDE1OjE4LCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+Pj4gT24g
MTIvMjMvMjAxNyAwOTo1MCBQTSwgTmljayBEZXNhdWxuaWVycyB3cm90ZToKPj4+Pj4gVGhlIGhl
YWRlciBkZWNsYXJlcyB0aGlzIGZ1bmN0aW9uIGFzIF9faW5pdCBidXQgaXMgZGVmaW5lZCBpbiBf
X3JlZgo+Pj4+PiBzZWN0aW9uLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBOaWNrIERlc2F1
bG5pZXJzIDxuaWNrLmRlc2F1bG5pZXJzQGdtYWlsLmNvbT4KPj4+PiBBRkFJSyBzZWN0aW9uIGF0
dHJpYnV0ZXMgaW4gaGVhZGVyIGZpbGVzIGFyZSBpZ25vcmVkIGJ5IGNvbXBpbGVyIGFueXdheQo+
Pj4+IHNvIEknZCByZW1vdmUgYWxsIG9mIHRoZW0uCj4+PiBIbW0sIEknbSBub3Qgc3VyZSBhbGwg
ZnV0dXJlIGNvbXBpbGVycyB3aWxsIGlnbm9yZSB0aGUgc2VjdGlvbgo+Pj4gYXR0cmlidXRlcy4g
aW5jbHVkZS9saW51eC9pbml0LmggZXhwbGljdGlseSBtZW50aW9ucyB3aGVyZSB0byBwdXQKPj4+
IHRoZSBhdHRydWJ1dGUgaW4gYSBwcm90b3R5cGUsIHNvIEknZCByYXRoZXIga2VlcCBpdC4KPj4g
QXR0cmlidXRlcyBpbiB0aGUgZGVjbGFyYXRpb24gYXJlIGZvciBzdGF0aWMgYW5hbHlzaXMgdG9v
bHMgc3VjaCBhcyBzcGFyc2UuCj4+Cj4+IEhvdyBlbHNlIGFyZSB5b3UgZ29pbmcgdG8gd29yayBv
dXQgd2hldGhlciBhIHNlY3Rpb24gbWlzbWF0Y2ggaGFzIG9jY3VycmVkPwo+Cj4gSXNuJ3QgdGhp
cyBkb25lIGJhc2VkIG9uIGRlZmluaXRpb25zPwo+Cj4gVG9ucyBvZiBfX2luaXQgcm91dGluZXMg
ZG9uJ3QgaGF2ZSB0aGUgYXR0cmlidXRlIHNwZWNpZmllZCBpbiBoZWFkZXIKPiBmaWxlcy4gSW4g
ZmFjdCwgZXZlbiBpbiB0aGlzIGZpbGUgKGFyY2gveDg2L3hlbi94ZW4tb3BzLmgpIHRoZXJlIGFy
ZQo+IHNvbWUgdGhhdCBkb24ndCBoYXZlIGl0Lgo+Cj4gLWJvcmlzCgpXaGF0IGFyZSB0aGUgbmV4
dCBzdGVwcyBmb3IgZ2V0dGluZyB0aGlzIHBhdGNoIG1lcmdlZD8gVGhpcyBpcyB0aGUKb25seSBm
dW5jdGlvbiBmb3Igd2hpY2ggSSBnZXQgYSBjb21waWxlciB3YXJuaW5nICh3aXRoIENsYW5nKS4g
IERvIHlvdQpyZXF1aXJlIGEgcGF0Y2ggaW5zdGVhZCB0aGF0IGNoYW5nZXMgbW9yZSBmdW5jdGlv
biBhdHRyaWJ1dGVzLCBvciBjYW4KdGhhdCBiZSBhIGZvbGxvdyB1cCBwYXRjaD8KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
