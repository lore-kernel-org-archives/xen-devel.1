From: Dave Young <dyoung@redhat.com>
Subject: Re: [PATCH RFC 3/6] kexec: export PG_offline to
 VMCOREINFO
Date: Thu, 15 Nov 2018 14:19:23 +0800
Message-ID: <20181115061923.GA3971__25314.5856470384$1542262722$gmane$org@dhcp-128-65.nay.redhat.com>
References: <20181114211704.6381-1-david@redhat.com>
 <20181114211704.6381-4-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QrYY=N2=redhat.com=dyoung@srs-us1.protection.inumbo.net>)
 id 1gNB09-0006Hb-0M
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 06:19:41 +0000
Content-Disposition: inline
In-Reply-To: <20181114211704.6381-4-david@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: Michal Hocko <mhocko@suse.com>, Arnd Bergmann <arnd@arndb.de>, Baoquan He <bhe@redhat.com>, linux-pm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Borislav Petkov <bp@alien8.de>, xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, devel@linuxdriverproject.org, Andrew Morton <akpm@linux-foundation.org>, Omar Sandoval <osandov@fb.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Lianbo Jiang <lijiang@redhat.com>
List-Id: xen-devel@lists.xenproject.org

SGkgRGF2aWQsCgpPbiAxMS8xNC8xOCBhdCAxMDoxN3BtLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90
ZToKPiBMZXQncyBleHBvcnQgUEdfb2ZmbGluZSB2aWEgUEFHRV9PRkZMSU5FX01BUENPVU5UX1ZB
TFVFLCBzbwo+IG1ha2VkdW1wZmlsZSBjYW4gZGlyZWN0bHkgc2tpcCBwYWdlcyB0aGF0IGFyZSBs
b2dpY2FsbHkgb2ZmbGluZSBhbmQgdGhlCj4gY29udGVudCB0aGVyZWZvcmUgc3RhbGUuCgpJdCB3
b3VsZCBiZSBnb29kIHRvIGNvcHkgc29tZSBiYWNrZ3JvdW5kIGluZm8gZnJvbSBjb3ZlciBsZXR0
ZXIgdG8gdGhlCnBhdGNoIGRlc2NyaXB0aW9uIHNvIHRoYXQgd2UgY2FuIGdldCBiZXR0ZXIgdW5k
ZXJzdGFuZGluZyB3aHkgdGhpcyBpcwpuZWVkZWQgbm93LgoKQlRXLCBMaWFuYm8gaXMgd29ya2lu
ZyBvbiBhIGRvY3VtZW50YXRpb24gb2YgdGhlIHZtY29yZWluZm8gZXhwb3J0ZWQKZmllbGRzLiBD
Y2luZyBoaW0gc28gdGhhdCBoZSBpcyBhd2FyZSBvZiB0aGlzLgoKQWxzbyBjYyBCb3JpcywgIGFs
dGhvdWdoIEkgZG8gbm90IHdhbnQgdGhlIGRvYyBjaGFuZ2VzIGJsb2NrcyB0aGlzCmhlIG1pZ2h0
IGhhdmUgZGlmZmVyZW50IG9waW5pb24gOikKCj4gCj4gQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1A
bGludXgtZm91bmRhdGlvbi5vcmc+Cj4gQ2M6IERhdmUgWW91bmcgPGR5b3VuZ0ByZWRoYXQuY29t
Pgo+IENjOiAiS2lyaWxsIEEuIFNodXRlbW92IiA8a2lyaWxsLnNodXRlbW92QGxpbnV4LmludGVs
LmNvbT4KPiBDYzogQmFvcXVhbiBIZSA8YmhlQHJlZGhhdC5jb20+Cj4gQ2M6IE9tYXIgU2FuZG92
YWwgPG9zYW5kb3ZAZmIuY29tPgo+IENjOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+
IENjOiBNYXR0aGV3IFdpbGNveCA8d2lsbHlAaW5mcmFkZWFkLm9yZz4KPiBDYzogTWljaGFsIEhv
Y2tvIDxtaG9ja29Ac3VzZS5jb20+Cj4gQ2M6ICJNaWNoYWVsIFMuIFRzaXJraW4iIDxtc3RAcmVk
aGF0LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0
LmNvbT4KPiAtLS0KPiAga2VybmVsL2NyYXNoX2NvcmUuYyB8IDIgKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9rZXJuZWwvY3Jhc2hfY29yZS5j
IGIva2VybmVsL2NyYXNoX2NvcmUuYwo+IGluZGV4IDkzM2NiM2U0NWI5OC4uMDkzYzlmOTE3ZWQw
IDEwMDY0NAo+IC0tLSBhL2tlcm5lbC9jcmFzaF9jb3JlLmMKPiArKysgYi9rZXJuZWwvY3Jhc2hf
Y29yZS5jCj4gQEAgLTQ2NCw2ICs0NjQsOCBAQCBzdGF0aWMgaW50IF9faW5pdCBjcmFzaF9zYXZl
X3ZtY29yZWluZm9faW5pdCh2b2lkKQo+ICAJVk1DT1JFSU5GT19OVU1CRVIoUEFHRV9CVUREWV9N
QVBDT1VOVF9WQUxVRSk7Cj4gICNpZmRlZiBDT05GSUdfSFVHRVRMQl9QQUdFCj4gIAlWTUNPUkVJ
TkZPX05VTUJFUihIVUdFVExCX1BBR0VfRFRPUik7Cj4gKyNkZWZpbmUgUEFHRV9PRkZMSU5FX01B
UENPVU5UX1ZBTFVFCSh+UEdfb2ZmbGluZSkKPiArCVZNQ09SRUlORk9fTlVNQkVSKFBBR0VfT0ZG
TElORV9NQVBDT1VOVF9WQUxVRSk7Cj4gICNlbmRpZgo+ICAKPiAgCWFyY2hfY3Jhc2hfc2F2ZV92
bWNvcmVpbmZvKCk7Cj4gLS0gCj4gMi4xNy4yCj4gCgpUaGFua3MKRGF2ZQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
