From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH V2 3/3] xen/arm: Add SCIFA UART support for
 early printk
Date: Tue, 19 Feb 2019 10:09:05 +0000
Message-ID: <ffc9d12a-0579-bcfd-428b-401524949009@arm.com>
References: <1549024652-24805-1-git-send-email-olekstysh@gmail.com>
 <1549024652-24805-4-git-send-email-olekstysh@gmail.com>
 <c3ae0a46-8418-c426-c87a-96f30730bbda@arm.com>
 <7fb34ed2-f763-938c-0884-844d1fbe1127@gmail.com>
 <a4f9f1f1-aa25-0faf-4938-78fe396a1ebc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=azty=Q2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gw2wc-0003vU-4I
 for xen-devel@lists.xenproject.org; Tue, 19 Feb 2019 10:48:10 +0000
In-Reply-To: <a4f9f1f1-aa25-0faf-4938-78fe396a1ebc@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGkgT2xla3NhbmRyLAoKT24gMi8xOC8xOSA4OjQ1IFBNLCBPbGVrc2FuZHIgd3JvdGU6Cj4gCj4g
T24gMTguMDIuMTkgMjI6NDEsIE9sZWtzYW5kciB3cm90ZToKPj4KPj4gT24gMTguMDIuMTkgMTY6
MDUsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+IEhpLAo+Pgo+Pgo+PiBIaQo+Pgo+Pgo+Pj4KPj4+
IE9uIDAxLzAyLzIwMTkgMTI6MzcsIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3RlOgo+Pj4+IEZy
b206IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4K
Pj4+Pgo+Pj4+IEFkZCBzdXBwb3J0IGZvciBSZW5lc2FzICJTdG91dCIgZGV2ZWxvcG1lbnQgYm9h
cmQgYmFzZWQgb24KPj4+PiBSLUNhciBIMiBTb0Mgd2hpY2ggaGFzIFNDSUZBIGNvbXBhdGlibGUg
VUFSVC4KPj4+Pgo+Pj4+IEFjdHVhbGx5IGV4aXN0aW5nIFNDSUYgVUFSVCBzdXBwb3J0IChkZWJ1
Zy1zY2lmLmluYykgYW5kCj4+Pj4gbmV3bHkgYWRkZWQgU0NJRkEgVUFSVCBzdXBwb3J0IChkZWJ1
Zy1zY2lmYS5pbmMpIGRpZmZlciBvbmx5Cj4+Pj4gaW4gcmVnaXN0ZXJzIG9mZnNldHMuCj4+Pgo+
Pj4gQ2FuIHdlIHRyeSB0byBtZXJnZSB0aGUgdHdvIHRoZW4/IE9uZSBzb2x1dGlvbiBpcyB0byBw
cm92aWRlIGFub3RoZXIgCj4+PiBvcHRpb25zIHNpbWlsYXIgdG8gaG93IHdlIGRlYWwgd2l0aCBS
RUdfU0hJRlQgb24gdGhlIDgyNTAuCj4+Cj4+Cj4+IEFjdHVhbGx5LCB0aGUgbWFpbiBkaWZmZXJl
bmNlIGZvciB0aGUgImVhcmx5IHByaW50ayIgc3VwcG9ydCBpcyBpbiB0d28gCj4+IHJlZyBvZmZz
ZXRzOgo+Pgo+PiArI2RlZmluZSBTQ0lGQV9TQ0FTU1LCoMKgIDB4MTTCoMKgwqAgLyogU2VyaWFs
IHN0YXR1cyByZWdpc3RlciAqLwo+PiArI2RlZmluZSBTQ0lGQV9TQ0FGVERSwqAgMHgyMMKgwqDC
oCAvKiBUcmFuc21pdCBGSUZPIGRhdGEgcmVnaXN0ZXIgKi8KPj4KPj4gKyNkZWZpbmUgU0NJRl9T
Q0ZTUsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDEwwqDCoMKgIC8qIFNlcmlhbCBzdGF0dXMg
cmVnaXN0ZXIgKi8KPj4gKyNkZWZpbmUgU0NJRl9TQ0ZURFLCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IDB4MGPCoMKgwqAgLyogVHJhbnNtaXQgRklGTyBkYXRhIHJlZ2lzdGVyICovCj4+Cj4+Cj4+IEkg
YW0gbm90IG1pc3Rha2VuLCB3ZSB3aWxsIGhhdmUgdG8gaW50cm9kdWNlIHR3byBvcHRpb25zIHRv
IGNvdmVyIHRoaXMgCj4+IGNhc2UsIGFzIHRoZSBvZmZzZXRzIGFyZSBub3QgY29ycmVsYXRlZCB3
aXRoIGVhY2ggb3RoZXIsIG5vPwoKWW91IGRvbid0IG5lZWQgdHdvIG9wdGlvbnMuIEZvciBpbnN0
YW5jZSwgeW91IGNhbiBvbmx5IGludHJvZHVjZSBhbiAKb3B0aW9uIFNDSUZfVkVSU0lPTiB0aGF0
IHdvdWxkIGJlIDAgZm9yIFNDSUYgYW5kIDYxIChhc2NpaSAnYScpIGZvciBTQ0lGQS4KClRoZW4g
aW4gdGhlIGNvZGUsIHlvdSBjYW4gdXNlIFNDSUZfVkVSU0lPTiB0byBkZWNpZGVzIHdoaWNoIHNl
dHMgb2YgCm1hY3JvcyB5b3UgYXJlIHVzaW5nLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
