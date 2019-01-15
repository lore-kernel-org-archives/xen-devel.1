From: Souptick Joarder <jrdr.linux@gmail.com>
Subject: Re: [PATCH 9/9] xen/privcmd-buf.c: Convert to use
 vm_insert_range_buggy
Date: Tue, 15 Jan 2019 11:11:56 +0530
Message-ID: <CAFqt6zbgrdhoaZXW+5vHu2kV-LmtXMGAcmrv+28i78x0z4Fweg__17560.4260563434$1547530869$gmane$org@mail.gmail.com>
References: <20190111151326.GA2853@jordon-HP-15-Notebook-PC>
 <8b0e0809-8e66-079d-1186-90b3f2df7a38@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6L6q=PX=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1gjHUJ-0001Th-Vt
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 05:42:12 +0000
Received: by mail-lf1-x143.google.com with SMTP id v5so1063095lfe.7
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jan 2019 21:42:09 -0800 (PST)
In-Reply-To: <8b0e0809-8e66-079d-1186-90b3f2df7a38@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, Michal Hocko <mhocko@suse.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org, Linux-MM <linux-mm@kvack.org>, xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, robin.murphy@arm.com
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMTUsIDIwMTkgYXQgNTowMSBBTSBCb3JpcyBPc3Ryb3Zza3kKPGJvcmlzLm9z
dHJvdnNreUBvcmFjbGUuY29tPiB3cm90ZToKPgo+IE9uIDEvMTEvMTkgMTA6MTMgQU0sIFNvdXB0
aWNrIEpvYXJkZXIgd3JvdGU6Cj4gPiBDb252ZXJ0IHRvIHVzZSB2bV9pbnNlcnRfcmFuZ2VfYnVn
Z3koKSB0byBtYXAgcmFuZ2Ugb2Yga2VybmVsCj4gPiBtZW1vcnkgdG8gdXNlciB2bWEuCj4gPgo+
ID4gVGhpcyBkcml2ZXIgaGFzIGlnbm9yZWQgdm1fcGdvZmYuIFdlIGNvdWxkIGxhdGVyICJmaXgi
IHRoZXNlIGRyaXZlcnMKPiA+IHRvIGJlaGF2ZSBhY2NvcmRpbmcgdG8gdGhlIG5vcm1hbCB2bV9w
Z29mZiBvZmZzZXR0aW5nIHNpbXBseSBieQo+ID4gcmVtb3ZpbmcgdGhlIF9idWdneSBzdWZmaXgg
b24gdGhlIGZ1bmN0aW9uIG5hbWUgYW5kIGlmIHRoYXQgY2F1c2VzCj4gPiByZWdyZXNzaW9ucywg
aXQgZ2l2ZXMgdXMgYW4gZWFzeSB3YXkgdG8gcmV2ZXJ0Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IFNvdXB0aWNrIEpvYXJkZXIgPGpyZHIubGludXhAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgZHJp
dmVycy94ZW4vcHJpdmNtZC1idWYuYyB8IDggKystLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3hlbi9wcml2Y21kLWJ1Zi5jIGIvZHJpdmVycy94ZW4vcHJpdmNtZC1idWYuYwo+ID4gaW5k
ZXggZGUwMWE2ZC4uYTlkN2U5NyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMveGVuL3ByaXZjbWQt
YnVmLmMKPiA+ICsrKyBiL2RyaXZlcnMveGVuL3ByaXZjbWQtYnVmLmMKPiA+IEBAIC0xNjYsMTIg
KzE2Niw4IEBAIHN0YXRpYyBpbnQgcHJpdmNtZF9idWZfbW1hcChzdHJ1Y3QgZmlsZSAqZmlsZSwg
c3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4gPiAgICAgICBpZiAodm1hX3ByaXYtPm5fcGFn
ZXMgIT0gY291bnQpCj4gPiAgICAgICAgICAgICAgIHJldCA9IC1FTk9NRU07Cj4gPiAgICAgICBl
bHNlCj4gPiAtICAgICAgICAgICAgIGZvciAoaSA9IDA7IGkgPCB2bWFfcHJpdi0+bl9wYWdlczsg
aSsrKSB7Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgcmV0ID0gdm1faW5zZXJ0X3BhZ2Uodm1h
LCB2bWEtPnZtX3N0YXJ0ICsgaSAqIFBBR0VfU0laRSwKPiA+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB2bWFfcHJpdi0+cGFnZXNbaV0pOwo+ID4gLSAgICAgICAg
ICAgICAgICAgICAgIGlmIChyZXQpCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICBi
cmVhazsKPiA+IC0gICAgICAgICAgICAgfQo+ID4gKyAgICAgICAgICAgICByZXQgPSB2bV9pbnNl
cnRfcmFuZ2VfYnVnZ3kodm1hLCB2bWFfcHJpdi0+cGFnZXMsCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm1hX3ByaXYtPm5fcGFnZXMpOwo+Cj4gVGhp
cyBjYW4gdXNlIHRoZSBub24tYnVnZ3kgdmVyc2lvbi4gQnV0IHNpbmNlIHRoZSBvcmlnaW5hbCBj
b2RlIHdhcwo+IGluZGVlZCBidWdneSBpbiB0aGlzIHJlc3BlY3QgSSBjYW4gc3VibWl0IHRoaXMg
YXMgYSBzZXBhcmF0ZSBwYXRjaCBsYXRlci4KPgo+IFNvCj4KPiBSZXZpZXdlZC1ieTogQm9yaXMg
T3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KClRoYW5rcyBCb3Jpcy4KPgo+
Cj4gPgo+ID4gICAgICAgaWYgKHJldCkKPiA+ICAgICAgICAgICAgICAgcHJpdmNtZF9idWZfdm1h
cHJpdl9mcmVlKHZtYV9wcml2KTsKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
