From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] pvcalls-back: do not return error on
	inet_accept EAGAIN
Date: Tue, 6 Feb 2018 15:52:08 +0100
Message-ID: <02c7c8ef-d8ed-2642-d178-2bde6c874028__93.072039499198$1517928665$gmane$org@suse.com>
References: <alpine.DEB.2.10.1802021728420.10160@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ywto=fa=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ej4bU-0006OM-D7
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2018 14:52:12 +0000
In-Reply-To: <alpine.DEB.2.10.1802021728420.10160@sstabellini-ThinkPad-X260>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, boris.ostrovsky@oracle.com
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMDIvMTggMDI6MzQsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBXaGVuIHRoZSBj
bGllbnQgc2VuZHMgYSByZWd1bGFyIGJsb2NraW5nIGFjY2VwdCByZXF1ZXN0LCB0aGUgYmFja2Vu
ZCBpcwo+IGV4cGVjdGVkIHRvIHJldHVybiBvbmx5IHdoZW4gdGhlIGFjY2VwdCBpcyBjb21wbGV0
ZWQsIHNpbXVsYXRpbmcgYQo+IGJsb2NraW5nIGJlaGF2aW9yLCBvciByZXR1cm4gYW4gZXJyb3Iu
Cj4gCj4gU3BlY2lmaWNhbGx5LCBvbiBFQUdBSU4gZnJvbSBpbmV0X2FjY2VwdCwgdGhlIGJhY2tl
bmQgc2hvdWxkbid0IHJldHVybgo+ICJFQUdBSU4iIHRvIHRoZSBjbGllbnQuIEluc3RlYWQsIGl0
IHNob3VsZCBzaW1wbHkgY29udGludWUgdGhlIHdhaXQuCj4gT3RoZXJ3aXNlLCB0aGUgY2xpZW50
IHdpbGwgc2VuZCBhbm90aGVyIGFjY2VwdCByZXF1ZXN0LCB3aGljaCB3aWxsIGNhdXNlCj4gYW5v
dGhlciBFQUdBSU4gdG8gYmUgc2VudCBiYWNrLCB3aGljaCBpcyBhIHdhc3RlIG9mIHJlc291cmNl
cyBhbmQgbm90Cj4gY29uZm9ybWluZyB0byB0aGUgZXhwZWN0ZWQgYmVoYXZpb3IuIENoYW5nZSB0
aGUgYmVoYXZpb3IgYnkgdHVybmluZyB0aGUKPiAiZ290byBlcnJvciIgaW50byBhIHJldHVybi4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9AYXBvcmV0by5j
b20+CgpDb21taXR0ZWQgdG8geGVuLnRpcCBmb3ItbGludXMtNC4xNgoKCkp1ZXJnZW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
