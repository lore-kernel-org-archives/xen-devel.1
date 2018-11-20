From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 5/8] hv_balloon: mark inflated pages
 PG_offline
Date: Tue, 20 Nov 2018 09:49:42 +0100
Message-ID: <6258a58b-28c7-c055-0752-e8bd085b835f__15582.184357527$1542703717$gmane$org@redhat.com>
References: <20181119101616.8901-1-david@redhat.com>
 <20181119101616.8901-6-david@redhat.com>
 <1747228.35250472.1542703532881.JavaMail.zimbra@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=s6JU=N7=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1gP1jF-0006Zy-Cp
 for xen-devel@lists.xenproject.org; Tue, 20 Nov 2018 08:49:53 +0000
In-Reply-To: <1747228.35250472.1542703532881.JavaMail.zimbra@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pankaj Gupta <pagupta@redhat.com>
Cc: Michal Hocko <mhocko@suse.com>, Stephen Hemminger <sthemmin@microsoft.com>, Kairui Song <kasong@redhat.com>, linux-pm@vger.kernel.org, pv-drivers@vmware.com, Haiyang Zhang <haiyangz@microsoft.com>, linux-doc@vger.kernel.org, kexec-ml <kexec@lists.infradead.org>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, devel@linuxdriverproject.org, Vitaly Kuznetsov <vkuznets@redhat.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjAuMTEuMTggMDk6NDUsIFBhbmthaiBHdXB0YSB3cm90ZToKPiAKPiBIaSBEYXZpZCwKPiAK
Pj4KPj4gTWFyayBpbmZsYXRlZCBhbmQgbmV2ZXIgb25saW5lZCBwYWdlcyBQR19vZmZsaW5lLCB0
byB0ZWxsIHRoZSB3b3JsZCB0aGF0Cj4+IHRoZSBjb250ZW50IGlzIHN0YWxlIGFuZCBzaG91bGQg
bm90IGJlIGR1bXBlZC4KPj4KPj4gQ2M6ICJLLiBZLiBTcmluaXZhc2FuIiA8a3lzQG1pY3Jvc29m
dC5jb20+Cj4+IENjOiBIYWl5YW5nIFpoYW5nIDxoYWl5YW5nekBtaWNyb3NvZnQuY29tPgo+PiBD
YzogU3RlcGhlbiBIZW1taW5nZXIgPHN0aGVtbWluQG1pY3Jvc29mdC5jb20+Cj4+IENjOiBLYWly
dWkgU29uZyA8a2Fzb25nQHJlZGhhdC5jb20+Cj4+IENjOiBWaXRhbHkgS3V6bmV0c292IDx2a3V6
bmV0c0ByZWRoYXQuY29tPgo+PiBDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0
aW9uLm9yZz4KPj4gQ2M6IE1hdHRoZXcgV2lsY294IDx3aWxseUBpbmZyYWRlYWQub3JnPgo+PiBD
YzogTWljaGFsIEhvY2tvIDxtaG9ja29Ac3VzZS5jb20+Cj4+IENjOiAiTWljaGFlbCBTLiBUc2ly
a2luIiA8bXN0QHJlZGhhdC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IERhdmlkIEhpbGRlbmJyYW5k
IDxkYXZpZEByZWRoYXQuY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvaHYvaHZfYmFsbG9vbi5jIHwg
MTQgKysrKysrKysrKysrLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9odi9odl9iYWxsb29uLmMg
Yi9kcml2ZXJzL2h2L2h2X2JhbGxvb24uYwo+PiBpbmRleCAyMTFmM2ZlM2EwMzguLjQ3NzE5ODYy
ZTU3ZiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9odi9odl9iYWxsb29uLmMKPj4gKysrIGIvZHJp
dmVycy9odi9odl9iYWxsb29uLmMKPj4gQEAgLTY4MSw4ICs2ODEsMTMgQEAgc3RhdGljIHN0cnVj
dCBub3RpZmllcl9ibG9jayBodl9tZW1vcnlfbmIgPSB7Cj4+ICAvKiBDaGVjayBpZiB0aGUgcGFy
dGljdWxhciBwYWdlIGlzIGJhY2tlZCBhbmQgY2FuIGJlIG9ubGluZWQgYW5kIG9ubGluZSBpdC4K
Pj4gICovCj4+ICBzdGF0aWMgdm9pZCBodl9wYWdlX29ubGluZV9vbmUoc3RydWN0IGh2X2hvdGFk
ZF9zdGF0ZSAqaGFzLCBzdHJ1Y3QgcGFnZSAqcGcpCj4+ICB7Cj4+IC0JaWYgKCFoYXNfcGZuX2lz
X2JhY2tlZChoYXMsIHBhZ2VfdG9fcGZuKHBnKSkpCj4+ICsJaWYgKCFoYXNfcGZuX2lzX2JhY2tl
ZChoYXMsIHBhZ2VfdG9fcGZuKHBnKSkpIHsKPj4gKwkJaWYgKCFQYWdlT2ZmbGluZShwZykpCj4+
ICsJCQlfX1NldFBhZ2VPZmZsaW5lKHBnKTsKPj4gIAkJcmV0dXJuOwo+PiArCX0KPj4gKwlpZiAo
UGFnZU9mZmxpbmUocGcpKQo+PiArCQlfX0NsZWFyUGFnZU9mZmxpbmUocGcpOwo+PiAgCj4+ICAJ
LyogVGhpcyBmcmFtZSBpcyBjdXJyZW50bHkgYmFja2VkOyBvbmxpbmUgdGhlIHBhZ2UuICovCj4+
ICAJX19vbmxpbmVfcGFnZV9zZXRfbGltaXRzKHBnKTsKPj4gQEAgLTEyMDEsNiArMTIwNiw3IEBA
IHN0YXRpYyB2b2lkIGZyZWVfYmFsbG9vbl9wYWdlcyhzdHJ1Y3QgaHZfZHlubWVtX2RldmljZQo+
PiAqZG0sCj4+ICAKPj4gIAlmb3IgKGkgPSAwOyBpIDwgbnVtX3BhZ2VzOyBpKyspIHsKPj4gIAkJ
cGcgPSBwZm5fdG9fcGFnZShpICsgc3RhcnRfZnJhbWUpOwo+PiArCQlfX0NsZWFyUGFnZU9mZmxp
bmUocGcpOwo+IAo+IEp1c3QgdGhpbmtpbmcsIGRvIHdlIG5lZWQgdG8gY2FyZSBmb3IgY2xlYXJp
bmcgUGFnZU9mZmxpbmUgZmxhZyBiZWZvcmUgZnJlZWluZwo+IGEgYmFsbG9vbidkIHBhZ2U/CgpZ
ZXMgd2UgaGF2ZSB0byBvdGhlcndpc2UgdGhlIGNvZGUgd2lsbCBjcmFzaCB3aGVuIHRyeWluZyB0
byBzZXQgUGFnZUJ1ZGR5LgoKKG9ubHkgb25lIHBhZ2UgdHlwZSBhdCBhIHRpbWUgbWF5IGJlIHNl
dCByaWdodCBub3csIGFuZCBpdCBtYWtlcyBzZW5zZS4KQSBwYWdlIHRoYXQgaXMgb2ZmbGluZSBj
YW5ub3QgZS5nLiBiZSBhIGJ1ZGR5IHBhZ2UpCgpTbyBQYWdlT2ZmbGluZSBpcyBjb21wbGV0ZWx5
IG1hbmFnZWQgYnkgdGhlIHBhZ2Ugb3duZXIuCgo+IAo+IFRoYW5rcywKPiBQYW5rYWoKCgotLSAK
ClRoYW5rcywKCkRhdmlkIC8gZGhpbGRlbmIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
