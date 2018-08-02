From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 01/15] re-work commit 3e06b989 "IOMMU:
 make page table population preemptible"...
Date: Thu, 02 Aug 2018 01:19:54 -0600
Message-ID: <5B62B09A02000078001DA278@prv1-mh.provo.novell.com>
References: <20180801134028.1654-1-paul.durrant@citrix.com>
 <20180801134028.1654-2-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=zvpq=kr=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fl7tt-0006wA-EG
 for xen-devel@lists.xenproject.org; Thu, 02 Aug 2018 07:19:57 +0000
In-Reply-To: <20180801134028.1654-2-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjA4LjE4IGF0IDE1OjQwLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IC4uLnRvIHNpbXBsaWZ5IHRoZSBpbXBsZW1lbnRhdGlvbiBhbmQgdHVybiBuZWVkX2lvbW11
IGJhY2sgaW50byBhIGJvb2xlYW4uCj4gCj4gQXMgbm90ZWQgaW4gWzFdIHRoZSB0cmktc3RhdGUg
bmF0dXJlIG9mIG5lZWRfaW9tbXUgYWZ0ZXIgY29tbWl0IDNlMDZiOTg5IGlzCj4gY29uZnVzaW5n
LCBhcyBpcyB0aGUgaW1wbGVtZW50YXRpb24gb2YgcHJlLWVtcHRpb24gdXNpbmcgcmVsbWVtX2xp
c3QuCj4gCj4gVGhpcyBwYXRjaCBpbnN0ZWFkIHVzZXMgYSBzaW1wbGUgY291bnQgb2YgcGFnZXMg
YWxyZWFkeSBwb3B1bGF0ZWQgc3RvcmVkIGluCj4gdGhlIHg4NiB2YXJpYW50IG9mIHN0cnVjdCBh
cmNoX2lvbW11IGFuZCBza2lwcyBvdmVyIHRoYXQgbnVtYmVyIG9mIHBhZ2VzCj4gaWYgYXJjaF9p
b21tdV9wb3B1bGF0ZV9wYWdlX3RhYmxlKCkgaXMgcmUtaW52b2tlZCBhZnRlciBwcmUtZW1wdGlv
bi4KCldlbGwsIHllcywgSSB3b3VsZCBoYXZlIHVzZWQgdGhhdCBtb2RlbCBpbiBzYWlkIGNvbW1p
dCBpZiBpdCB3YXMgcmVsaWFibGUsCmJ1dCBpdCBpc24ndDogV2hhdCBpZiB0aGUgbGlzdCBvZiBw
YWdlcyBjaGFuZ2VkIGJldHdlZW4gdHdvIChyZS0paW52b2NhdGlvbnM/CkZ1cnRoZXJtb3JlLCB3
aXRoIGh1Z2UgZW5vdWdoIGEgZ3Vlc3QgZXZlbiB0aGUgc2tpcHBpbmcgb2YgdGhlIGFscmVhZHkK
cHJvY2Vzc2VkIHNldmVyYWwgbWlsbGlvbiBwYWdlcyBtYXkgZXhoYXVzdCB0aGUgdGltZSBhY2Nl
cHRhYmxlIGJldHdlZW4KcHJlZW1wdGlvbiBwb2ludHMuCgpKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
