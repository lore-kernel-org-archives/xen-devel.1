From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 0/2 for-4.12] Introduce runstate area
 registration with phys address
Date: Thu, 7 Mar 2019 16:36:59 +0000
Message-ID: <0f89f12b-0111-5da0-9119-c35ebdacdd2f@arm.com>
References: <1551791671-21703-1-git-send-email-andrii.anisov@gmail.com>
 <c3a5728c-6425-29f9-8e5c-7b6da1f729ce@arm.com>
 <be2b4a60-d70d-9d28-d638-1a7fd11f0578@gmail.com>
 <59a2f220-5c90-381c-2c52-bb2cdb813e8e@arm.com>
 <e98e3651-c780-0bb8-d2ad-db1675b00c28@gmail.com>
 <fead3a5e-dd87-bd91-e07a-f7d0f068a88f@arm.com>
 <20190307161645.bs3u44czjkak7f34@Air-de-Roger>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20190307161645.bs3u44czjkak7f34@Air-de-Roger>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xen.org, Andrii Anisov <andrii_anisov@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii.anisov@gmail.com>
List-Id: xen-devel@lists.xenproject.org

SGkgUm9nZXIsCgpUaGFuayB5b3UgZm9yIHRoZSBhbnN3ZXIuCgpPbiAwNy8wMy8yMDE5IDE2OjE2
LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+IE9uIFRodSwgTWFyIDA3LCAyMDE5IGF0IDAzOjE3
OjU0UE0gKzAwMDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGkgQW5kcmlpLAo+Pgo+PiBPbiAw
Ny8wMy8yMDE5IDE0OjM0LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+Pj4gT24gMDcuMDMuMTkgMTY6
MDIsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+Pj4gIMKgwqAtIElNSE8sIHRoaXMgaW1wbGVtZW50
YXRpb24gaXMgc2ltcGxlciBhbmQgY2xlYW5lciB0aGFuIHdoYXQgSQo+Pj4+PiBoYXZlIGZvciBy
dW5zdGF0ZSBtYXBwaW5nIG9uIGFjY2Vzcy4KPj4+Pgo+Pj4+IERpZCB5b3UgaW1wbGVtZW50IGl0
IHVzaW5nIGFjY2Vzc19ndWVzdF9tZW1vcnlfYnlfaXBhPwo+Pj4gTm90IGV4YWN0bHksIGFjY2Vz
c19ndWVzdF9tZW1vcnlfYnlfaXBhKCkgaGFzIG5vIGltcGxlbWVudGF0aW9uIGZvciB4ODYuCj4+
PiBCdXQgaXQgaXMgbWFkZSBhcm91bmQgdGhhdCBjb2RlLgo+Pgo+PiBGb3IgdGhlIEhWTSwgdGhl
IGVxdWl2YWxlbnQgZnVuY3Rpb24gaXMgaHZtX2NvcHlfdG9fZ3Vlc3RfcGh5cy4gSSBkb24ndCBr
bm93Cj4+IHdoYXQgd291bGQgYmUgdGhlIGludGVyZmFjZSBmb3IgUFYuIFJvZ2VyLCBhbnkgaWRl
YT8KPiAKPiBGb3IgUFYgSSB0aGluayB5b3Ugd2lsbCBoYXZlIHRvIHVzZSBnZXRfcGFnZV9mcm9t
X2dmbiwgY2hlY2sgdGhlCj4gcGVybWlzc2lvbnMsIG1hcCBpdCwgd3JpdGUgYW5kIHVubWFwIGl0
LiBUaGUgc2FtZSBmbG93IHdvdWxkIGFsc28gd29yawo+IGZvciBIVk0sIHNvIEknbSBub3Qgc3Vy
ZSBpZiB0aGVyZSdzIG11Y2ggcG9pbnQgaW4gdXNpbmcKPiBodm1fY29weV90b19ndWVzdF9waHlz
LiBPciB5b3UgY2FuIGltcGxlbWVudCBhIGdlbmVyaWMKPiBjb3B5X3RvX2d1ZXN0X3BoeXMgaGVs
cGVyIHRoYXQgd29ya3MgZm9yIGJvdGggUFYgYW5kIEhWTS4KPiAKPiBOb3RlIHRoYXQgZm9yIHRy
YW5zbGF0ZWQgZ3Vlc3RzIHlvdSB3aWxsIGhhdmUgdG8gd2FsayB0aGUgSEFQIHBhZ2UKPiB0YWJs
ZXMgZm9yIGVhY2ggdkNQVSBmb3IgZWFjaCBjb250ZXh0IHN3aXRjaCwgd2hpY2ggSSB0aGluayB3
aWxsIGJlCj4gZXhwZW5zaXZlIGluIHRlcm1zIG9mIHBlcmZvcm1hbmNlIChJIG1pZ2h0IGJlIHdy
b25nIGhvd2V2ZXIsIHNpbmNlIEkKPiBoYXZlIG5vIHByb29mIG9mIHRoaXMpLgoKQUZBSUNULCB3
ZSBhbHJlYWR5IHdhbGsgdGhlIHBhZ2UtdGFibGUgd2l0aCB0aGUgY3VycmVudCBpbXBsZW1lbnRh
dGlvbi4gU28gdGhpcyAKc2hvdWxkIGJlIG5vIGRpZmZlcmVudCBoZXJlLCBleGNlcHQgd2Ugd2ls
bCBub3QgbmVlZCB0byB3YWxrIHRoZSBndWVzdC1QVCBoZXJlLiBObz8KCkNoZWVycywKCi0tIApK
dWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
