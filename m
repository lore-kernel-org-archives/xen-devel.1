From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 4/8] xen/balloon: mark inflated pages
 PG_offline
Date: Fri, 23 Nov 2018 14:41:43 +0100
Message-ID: <3d5250b7-870e-e702-a6e4-937d2362fea4__29496.5217043229$1542980428$gmane$org@suse.com>
References: <20181122100627.5189-1-david@redhat.com>
 <20181122100627.5189-5-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=h732=oc=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gQBiN-0002MS-4z
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 13:41:47 +0000
In-Reply-To: <20181122100627.5189-5-david@redhat.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, linux-pm@vger.kernel.org, pv-drivers@vmware.com, linux-doc@vger.kernel.org, kexec-ml <kexec@lists.infradead.org>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, Michal Hocko <mhocko@suse.com>, "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, devel@linuxdriverproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMTEvMjAxOCAxMTowNiwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4gTWFyayBpbmZs
YXRlZCBhbmQgbmV2ZXIgb25saW5lZCBwYWdlcyBQR19vZmZsaW5lLCB0byB0ZWxsIHRoZSB3b3Js
ZCB0aGF0Cj4gdGhlIGNvbnRlbnQgaXMgc3RhbGUgYW5kIHNob3VsZCBub3QgYmUgZHVtcGVkLgo+
IAo+IENjOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgo+IENj
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiBDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51
eC1mb3VuZGF0aW9uLm9yZz4KPiBDYzogTWF0dGhldyBXaWxjb3ggPHdpbGx5QGluZnJhZGVhZC5v
cmc+Cj4gQ2M6IE1pY2hhbCBIb2NrbyA8bWhvY2tvQHN1c2UuY29tPgo+IENjOiAiTWljaGFlbCBT
LiBUc2lya2luIiA8bXN0QHJlZGhhdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgSGlsZGVu
YnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+CgpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
