From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 4/8] xen/balloon: mark inflated pages
 PG_offline
Date: Mon, 19 Nov 2018 14:07:18 +0100
Message-ID: <554d4e68-8fa9-6849-8480-fc9446bea79d__8028.81130152873$1542632777$gmane$org@redhat.com>
References: <20181119101616.8901-1-david@redhat.com>
 <20181119101616.8901-5-david@redhat.com>
 <fc69e0cf-c005-472a-b3f6-09d0c963cf52@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Bx+7=N6=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1gOjGv-0003DQ-Lc
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 13:07:25 +0000
In-Reply-To: <fc69e0cf-c005-472a-b3f6-09d0c963cf52@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, linux-mm@kvack.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, linux-pm@vger.kernel.org, pv-drivers@vmware.com, linux-doc@vger.kernel.org, kexec-ml <kexec@lists.infradead.org>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, Michal Hocko <mhocko@suse.com>, "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, devel@linuxdriverproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTkuMTEuMTggMTM6MjIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMTkvMTEvMjAxOCAx
MToxNiwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+IE1hcmsgaW5mbGF0ZWQgYW5kIG5ldmVy
IG9ubGluZWQgcGFnZXMgUEdfb2ZmbGluZSwgdG8gdGVsbCB0aGUgd29ybGQgdGhhdAo+PiB0aGUg
Y29udGVudCBpcyBzdGFsZSBhbmQgc2hvdWxkIG5vdCBiZSBkdW1wZWQuCj4+Cj4+IENjOiBCb3Jp
cyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgo+PiBDYzogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPgo+PiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVs
bGluaUBrZXJuZWwub3JnPgo+PiBDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0
aW9uLm9yZz4KPj4gQ2M6IE1hdHRoZXcgV2lsY294IDx3aWxseUBpbmZyYWRlYWQub3JnPgo+PiBD
YzogTWljaGFsIEhvY2tvIDxtaG9ja29Ac3VzZS5jb20+Cj4+IENjOiAiTWljaGFlbCBTLiBUc2ly
a2luIiA8bXN0QHJlZGhhdC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IERhdmlkIEhpbGRlbmJyYW5k
IDxkYXZpZEByZWRoYXQuY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMveGVuL2JhbGxvb24uYyB8IDMg
KysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3hlbi9iYWxsb29uLmMgYi9kcml2ZXJzL3hlbi9iYWxsb29uLmMKPj4gaW5kZXgg
MTIxNDgyODlkZWJkLi4xNGRkNmI4MTRkYjMgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMveGVuL2Jh
bGxvb24uYwo+PiArKysgYi9kcml2ZXJzL3hlbi9iYWxsb29uLmMKPj4gQEAgLTQyNSw2ICs0MjUs
NyBAQCBzdGF0aWMgaW50IHhlbl9icmluZ19wZ3Nfb25saW5lKHN0cnVjdCBwYWdlICpwZywgdW5z
aWduZWQgaW50IG9yZGVyKQo+PiAgCWZvciAoaSA9IDA7IGkgPCBzaXplOyBpKyspIHsKPj4gIAkJ
cCA9IHBmbl90b19wYWdlKHN0YXJ0X3BmbiArIGkpOwo+PiAgCQlfX29ubGluZV9wYWdlX3NldF9s
aW1pdHMocCk7Cj4+ICsJCV9fU2V0UGFnZU9mZmxpbmUocCk7Cj4+ICAJCV9fYmFsbG9vbl9hcHBl
bmQocCk7Cj4+ICAJfQo+IAo+IFRoaXMgc2VlbXMgbm90IHRvIGJlIGJhc2VkIG9uIGN1cnJlbnQg
bWFzdGVyLiBDb3VsZCB5b3UgcGxlYXNlIHRlbGwKPiBhZ2FpbnN0IHdoaWNoIHRyZWUgdGhpcyBz
aG91bGQgYmUgcmV2aWV3ZWQ/Cj4gCkhpIEp1ZXJnZW4sCgp0aGlzIGlzIGJhc2VkIG9uIGxpbnV4
LW5leHQvbWFzdGVyLgoKVGhhbmtzIQoKPiAKPiBKdWVyZ2VuCj4gCgoKLS0gCgpUaGFua3MsCgpE
YXZpZCAvIGRoaWxkZW5iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
