From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 1/5] arm/alternatives: Fix
 apply_alternatives() API
Date: Tue, 30 Jan 2018 10:55:22 +0000
Message-ID: <dde52f58-12cc-5d4c-e8bb-44ae68585d7e@arm.com>
References: <1517240291-32409-1-git-send-email-andrew.cooper3@citrix.com>
 <1517240291-32409-2-git-send-email-andrew.cooper3@citrix.com>
 <alpine.DEB.2.10.1801291221010.11958@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1801291221010.11958@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyOS8wMS8xOCAyMDoyMywgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IE9uIE1v
biwgMjkgSmFuIDIwMTgsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IFRoZSAhSEFTX0FMVEVSTkFU
SVZFIGNhc2UgaGFzIGJpdC1yb3R0ZW4gYW5kIHdvbid0IGV2ZW4gY29tcGlsZS4KPj4KPj4gVGhl
IHg4NiBzaWRlIG9mIGFwcGx5X2FsdGVybmF0aXZlcygpIGlzIHZvaWQsIHdoaWxlIHRoZSBBUk0g
c2lkZSByZXR1cm5zIGludC4KPj4gSG93ZXZlciwgdGhlIGZ1bmN0aW9ucyBjYW4ndCBmYWlsIGFu
ZCBubyByZXR1cm4gdmFsdWVzIGFyZSBjaGVja2VkLiAgU3dpdGNoCj4+IHRoZSBBUk0gc2lkZSB0
byBiZSB2b2lkIGFzIHdlbGwuCj4+Cj4+IE9uZSBvYnNlcnZhdGlvbiBpcyB0aGF0IF9fYXBwbHlf
YWx0ZXJuYXRpdmVzX211bHRpX3N0b3AoKSBpcyBvbmx5IHVzZWQgYXQgYm9vdAo+PiB0aW1lLCBz
byBjYW4gYmVjb21lIF9faW5pdCBhbmQgaXRzIHN0YXRpYyBkYXRhIGNhbiBiZWNvbWUgX19pbml0
ZGF0YQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgo+IAo+IEFja2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+Cj4gCj4gCj4+IC0tLQo+PiBDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1
c2UuY29tPgo+PiBDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
Pgo+PiBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4gQ0M6IEtvbnJh
ZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KPj4gQ0M6IFJvc3MgTGFn
ZXJ3YWxsIDxyb3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29tPgo+Pgo+PiBUT0RPOiBEcm9wIHRoZSAh
SEFTX0FMVEVSTkFUSVZFIGNhc2Ugb24gQVJNPwo+IAo+IFllYWgsIHdlIGNvdWxkIGRvLiBKdWxp
ZW4sIHdoYXQgZG8geW91IHRoaW5rPwoKU291bmRzIGdvb2QuIEluIHRoYXQgY2FzZSwgd2Ugc2hv
dWxkIHJlbW92ZSBhbGwgdGhlIHJlZmVyZW5jZSBvZiAKSEFTX0FMVEVSTkFUSVZFIGluIHRoZSBj
b2RlLgoKQ2hlZXJzLAoKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
