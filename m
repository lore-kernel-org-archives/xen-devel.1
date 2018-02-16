From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH V5] x86/hvm: fix domain crash when CR3 has
 the noflush bit set
Date: Fri, 16 Feb 2018 04:17:59 -0700
Message-ID: <5A86CBF702000078001A85C3@prv-mh.provo.novell.com>
References: <1518776535-2951-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1518776535-2951-1-git-send-email-rcojocaru@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: kevin.tian@intel.com, tamas@tklengyel.com, suravee.suthikulpanit@amd.com, george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com, tim@xen.org, xen-devel@lists.xen.org, jun.nakajima@intel.com, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjAyLjE4IGF0IDExOjIyLCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gVGhlIGVtdWxhdGlvbiBsYXllcnMgb2YgWGVuIGxhY2sgUENJRCBzdXBwb3J0LCBhbmQg
YXMgd2Ugb25seSBvZmZlcgo+IFBDSUQgdG8gSEFQIGd1ZXN0cywgYWxsIHdyaXRlcyB0byBDUjMg
YXJlIGhhbmRsZWQgYnkgaGFyZHdhcmUsCj4gZXhjZXB0IHdoZW4gaW50cm9zcGVjdGlvbiBpcyBp
bnZvbHZlZC4gQ29uc2VxdWVudGx5LCB0cnlpbmcgdG8gc2V0Cj4gQ1IzIHdoZW4gdGhlIG5vZmx1
c2ggYml0IGlzIHNldCBpbiBodm1fc2V0X2NyMygpIGxlYWRzIHRvIGRvbWFpbgo+IGNyYXNoZXMu
IFRoZSB3b3JrYXJvdW5kIGlzIHRvIGNsZWFyIHRoZSBub2ZsdXNoIGJpdCBpbgo+IGh2bV9zZXRf
Y3IzKCkuIENSMyB2YWx1ZXMgaW4gaHZtX21vbml0b3JfY3IoKSBhcmUgYWxzbyBzYW5pdGl6ZWQu
Cj4gQWRkaXRpb25hbGx5LCBhIGJvb2wgcGFyYW1ldGVyIG5vdyBwcm9wYWdhdGVzIHRvCj4ge3N2
bSx2bXh9X3VwZGF0ZV9ndWVzdF9jcigpLCBzbyB0aGF0IG5vIGZsdXNoZXMgb2NjdXIgd2hlbgo+
IHRoZSBiaXQgd2FzIHNldC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJj
b2pvY2FydUBiaXRkZWZlbmRlci5jb20+Cj4gUmVwb3J0ZWQtYnk6IEJpdHdlYXNpbCA8Yml0d2Vh
c2lsQGNyeXB0b2hhemUuY29tPgo+IFN1Z2dlc3RlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBBY2tlZC1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0
a2xlbmd5ZWwuY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
