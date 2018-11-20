From: Pankaj Gupta <pagupta@redhat.com>
Subject: Re: [PATCH v1 5/8] hv_balloon: mark inflated pages
 PG_offline
Date: Tue, 20 Nov 2018 04:37:16 -0500 (EST)
Message-ID: <1380154502.35259416.1542706636322.JavaMail.zimbra__9582.82372816957$1542706567$gmane$org@redhat.com>
References: <20181119101616.8901-1-david@redhat.com>
 <20181119101616.8901-6-david@redhat.com>
 <1747228.35250472.1542703532881.JavaMail.zimbra@redhat.com>
 <6258a58b-28c7-c055-0752-e8bd085b835f@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Mgq0=N7=redhat.com=pagupta@srs-us1.protection.inumbo.net>)
 id 1gP2T8-0002Ky-Tw
 for xen-devel@lists.xenproject.org; Tue, 20 Nov 2018 09:37:18 +0000
In-Reply-To: <6258a58b-28c7-c055-0752-e8bd085b835f@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: Michal Hocko <mhocko@suse.com>, Stephen Hemminger <sthemmin@microsoft.com>, Kairui Song <kasong@redhat.com>, linux-pm@vger.kernel.org, pv-drivers@vmware.com, Haiyang Zhang <haiyangz@microsoft.com>, linux-doc@vger.kernel.org, kexec-ml <kexec@lists.infradead.org>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, devel@linuxdriverproject.org, Vitaly Kuznetsov <vkuznets@redhat.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: xen-devel@lists.xenproject.org

Cj4gPj4gLS0tCj4gPj4gIGRyaXZlcnMvaHYvaHZfYmFsbG9vbi5jIHwgMTQgKysrKysrKysrKysr
LS0KPiA+PiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9odi9odl9iYWxsb29uLmMgYi9kcml2ZXJz
L2h2L2h2X2JhbGxvb24uYwo+ID4+IGluZGV4IDIxMWYzZmUzYTAzOC4uNDc3MTk4NjJlNTdmIDEw
MDY0NAo+ID4+IC0tLSBhL2RyaXZlcnMvaHYvaHZfYmFsbG9vbi5jCj4gPj4gKysrIGIvZHJpdmVy
cy9odi9odl9iYWxsb29uLmMKPiA+PiBAQCAtNjgxLDggKzY4MSwxMyBAQCBzdGF0aWMgc3RydWN0
IG5vdGlmaWVyX2Jsb2NrIGh2X21lbW9yeV9uYiA9IHsKPiA+PiAgLyogQ2hlY2sgaWYgdGhlIHBh
cnRpY3VsYXIgcGFnZSBpcyBiYWNrZWQgYW5kIGNhbiBiZSBvbmxpbmVkIGFuZCBvbmxpbmUKPiA+
PiAgaXQuCj4gPj4gICovCj4gPj4gIHN0YXRpYyB2b2lkIGh2X3BhZ2Vfb25saW5lX29uZShzdHJ1
Y3QgaHZfaG90YWRkX3N0YXRlICpoYXMsIHN0cnVjdCBwYWdlCj4gPj4gICpwZykKPiA+PiAgewo+
ID4+IC0JaWYgKCFoYXNfcGZuX2lzX2JhY2tlZChoYXMsIHBhZ2VfdG9fcGZuKHBnKSkpCj4gPj4g
KwlpZiAoIWhhc19wZm5faXNfYmFja2VkKGhhcywgcGFnZV90b19wZm4ocGcpKSkgewo+ID4+ICsJ
CWlmICghUGFnZU9mZmxpbmUocGcpKQo+ID4+ICsJCQlfX1NldFBhZ2VPZmZsaW5lKHBnKTsKPiA+
PiAgCQlyZXR1cm47Cj4gPj4gKwl9Cj4gPj4gKwlpZiAoUGFnZU9mZmxpbmUocGcpKQo+ID4+ICsJ
CV9fQ2xlYXJQYWdlT2ZmbGluZShwZyk7Cj4gPj4gIAo+ID4+ICAJLyogVGhpcyBmcmFtZSBpcyBj
dXJyZW50bHkgYmFja2VkOyBvbmxpbmUgdGhlIHBhZ2UuICovCj4gPj4gIAlfX29ubGluZV9wYWdl
X3NldF9saW1pdHMocGcpOwo+ID4+IEBAIC0xMjAxLDYgKzEyMDYsNyBAQCBzdGF0aWMgdm9pZCBm
cmVlX2JhbGxvb25fcGFnZXMoc3RydWN0Cj4gPj4gaHZfZHlubWVtX2RldmljZQo+ID4+ICpkbSwK
PiA+PiAgCj4gPj4gIAlmb3IgKGkgPSAwOyBpIDwgbnVtX3BhZ2VzOyBpKyspIHsKPiA+PiAgCQlw
ZyA9IHBmbl90b19wYWdlKGkgKyBzdGFydF9mcmFtZSk7Cj4gPj4gKwkJX19DbGVhclBhZ2VPZmZs
aW5lKHBnKTsKPiA+IAo+ID4gSnVzdCB0aGlua2luZywgZG8gd2UgbmVlZCB0byBjYXJlIGZvciBj
bGVhcmluZyBQYWdlT2ZmbGluZSBmbGFnIGJlZm9yZQo+ID4gZnJlZWluZwo+ID4gYSBiYWxsb29u
J2QgcGFnZT8KPiAKPiBZZXMgd2UgaGF2ZSB0byBvdGhlcndpc2UgdGhlIGNvZGUgd2lsbCBjcmFz
aCB3aGVuIHRyeWluZyB0byBzZXQgUGFnZUJ1ZGR5Lgo+IAo+IChvbmx5IG9uZSBwYWdlIHR5cGUg
YXQgYSB0aW1lIG1heSBiZSBzZXQgcmlnaHQgbm93LCBhbmQgaXQgbWFrZXMgc2Vuc2UuCj4gQSBw
YWdlIHRoYXQgaXMgb2ZmbGluZSBjYW5ub3QgZS5nLiBiZSBhIGJ1ZGR5IHBhZ2UpCgpvLmsKPiAK
PiBTbyBQYWdlT2ZmbGluZSBpcyBjb21wbGV0ZWx5IG1hbmFnZWQgYnkgdGhlIHBhZ2Ugb3duZXIu
CgpNYWtlcyBzZW5zZS4gVGhhbmtzIGZvciBleHBsYWluaW5nLgoKUGFua2FqCj4gCj4gPiAKPiA+
IFRoYW5rcywKPiA+IFBhbmthago+IAo+IAo+IC0tCj4gCj4gVGhhbmtzLAo+IAo+IERhdmlkIC8g
ZGhpbGRlbmIKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
