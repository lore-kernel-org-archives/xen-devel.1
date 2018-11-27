From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] amd-iommu: remove page merging code
Date: Tue, 27 Nov 2018 08:57:44 -0700
Message-ID: <5BFD69780200007800200734@prv1-mh.provo.novell.com>
References: <20181127145808.28118-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2MkR=OG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gRfkE-0001R4-0R
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 15:57:50 +0000
In-Reply-To: <20181127145808.28118-1-paul.durrant@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjExLjE4IGF0IDE1OjU4LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IFRoZSBwYWdlIG1lcmdpbmcgbG9naWMgbWFrZXMgdXNlIG9mIGJpdHMgMS04IGFuZCBiaXQg
NjMgb2YgYSBQVEUsIHdoaWNoIHVzZWQKPiB0byBiZSBzcGVjaWZpZWQgYXMgaWdub3JlZC4gSG93
ZXZlciwgYml0cyA1IGFuZCA2IGFyZSBub3cgc3BlY2lmaWVkIGFzCj4gJ2FjY2Vzc2VkJyBhbmQg
J2RpcnR5JyBiaXRzIGFuZCB0aGVpciB1c2Ugb25seSByZW1haW5zIHNhZmUgYXMgbG9uZyBhcwo+
IHRoZSBEVEUgJ0hvc3QgQWNjZXNzIERpcnR5JyBiaXRzIHJlbWFpbiB1bnVzZWQgYnkgWGVuLgoK
Li4uIG9yIGFzIGxvbmcgdGhlIHR3byBwYWdlIHRhYmxlIGJpdHMgZG9uJ3QgZ2V0IG1hZGUgdXNl
IG9mCihieSBYZW4gb3IgaGFyZHdhcmUpIGJlZm9yZSB0aGUgZG9tYWluIHN0YXJ0cyBydW5uaW5n
IChpLmUuCnRoZSAiaGFyZHdhcmUiIHBhcnQgaXMgYWx3YXlzIHRydWUgYWZhaWN0KS4KCj4gVGhl
IGNvZGUgd2FzIGFsc28gdGhlIHN1YmplY3Qgb2YgWFNBLTI3NSBhbmQsIHNpbmNlIHRoZW4sIGhh
cyBiZWVuIGRpc2FibGVkCj4gYWZ0ZXIgZG9tYWluIGNyZWF0aW9uLgo+IAo+IFRoaXMgcGF0Y2gg
cmVtb3ZlcyB0aGUgY29kZSwgZnJlZWluZyB1cCB0aGUgcmVtYWluaW5nIFBURSAnaWdub3JlZCcg
Yml0cwo+IGZvciBvdGhlciBwb3RlbnRpYWwgdXNlIGFuZCBzaG9ydGVuaW5nIHRoZSBzb3VyY2Ug
YnkgMTcwIGxpbmVzLiBUaGVyZSBtYXkKPiBiZSBzb21lIG1hcmdpbmFsIHBlcmZvcm1hbmNlIGNv
c3Qgc2luY2UgaGlnaGVyIG9yZGVyIG1hcHBpbmdzIHdpbGwgbm93IGJlCj4gcnVsZWQgb3V0IHVu
dGlsIGEgbWFwcGluZyBvcmRlciBwYXJhbWV0ZXIgaXMgcGFzc2VkIHRvIGlvbW11X29wcy4KCiJN
YXJnaW5hbCIgaXMgYSBndWVzcywgb3Igc3VwcG9ydGVkIGJ5IGFjdHVhbCBtZWFzdXJlbWVudHM/
IFdpdGgKaGVhdnkgUy9HIG9mIHNtYWxsIGJsb2NrcyBvZiBkYXRhIEkgY291bGQgZWFzaWx5IHNl
ZSB0aGlzIGJlY29tZQptb3JlIHRoYW4gYSBtYXJnaW5hbCBpbmNyZWFzZSBvZiBvdmVyaGVhZC4g
SG93IGJhZCBpdCBpcyBjZXJ0YWlubHkKYWxzbyBkZXBlbmRzIG9uIElPVExCIGNhcGFjaXR5LgoK
V2hhdCBJIHdvdWxkIGZpbmQgbW9yZSBjb252aW5jaW5nIHdvdWxkIGJlIGlmIHRoZXJlIHdhcyBh
IHJlYXNvbgp3aHkgYSBmYWlyIHBhcnQgb2YgdGhlIGxhcmdlIHBhZ2UgbWFwcGluZ3MgZ2V0IHNo
YXR0ZXJlZCBhbnl3YXkKdG9kYXkuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
