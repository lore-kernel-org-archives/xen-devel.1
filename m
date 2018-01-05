From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC 01/44] passthrough/vtd: Don't DMA to the
 stack in queue_invalidate_wait()
Date: Fri, 05 Jan 2018 02:21:06 -0700
Message-ID: <5A4F5192020000780019B485@prv-mh.provo.novell.com>
References: <1515097329-31902-1-git-send-email-andrew.cooper3@citrix.com>
 <1515097329-31902-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1515097329-31902-2-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien.grall@arm.com>, Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjAxLjE4IGF0IDIxOjIxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gRE1BLWluZyB0byB0aGUgc3RhY2sgaXMgZ2VuZXJhbGx5IGNvbnNpZGVyZWQgYmFkIHBy
YWN0aWNlLiAgSW4gdGhpcyBjYXNlLCBpZiBhCj4gdGltZW91dCBvY2N1cnMgYmVjYXVzZSBvZiBh
IHNsdWdnaXNoIGRldmljZSB3aGljaCBpcyBwcm9jZXNzaW5nIHRoZSByZXF1ZXN0LAo+IHRoZSBj
b21wbGV0aW9uIG5vdGlmaWNhdGlvbiB3aWxsIGNvcnJ1cHQgdGhlIHN0YWNrIG9mIGEgc3Vic2Vx
dWVudCBkZWVwZXIgY2FsbAo+IHRyZWUuCj4gCj4gUGxhY2UgdGhlIHBvbGxfc2xvdCBpbiBhIHBl
cmNwdSBhcmVhIGFuZCBETUEgdG8gdGhhdCBpbnN0ZWFkLgo+IAo+IE5vdGU6IFRoaXMgY2hhbmdl
IGRvZXMgbm90IGFkZHJlc3Mgb3RoZXIgaXNzdWVzIHdpdGggdGhlIGN1cnJlbnQKPiBpbXBsZW1l
bnRhdGlvbiwgc3VjaCBhcyBvbmNlIGEgdGltZW91dCBoYXMgYmVlbiBzdWZmZXJlZCwgc3Vic2Vx
dWVudAo+IGNvbXBsZXRpb25zIGNhbid0IGJlIGNvcnJlbGF0ZWQgd2l0aCB0aGVpciByZXF1ZXN0
cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCj4g
SnVsaWVuOiBUaGlzIHdhbnRzIGJhY2twb3J0aW5nIHRvIGFsbCByZWxlYXNlcywgYW5kIHRoZXJl
Zm9yZSBzaG91bGQgYmUKPiBjb25zaWRlcmVkIGZvciA0LjEwIGF0IHRoaXMgcG9pbnQuCgpJbnRl
cmVzdGluZyByZW1hcmsgYXQgdGhpcyBwb2ludCBpbiB0aW1lIDstKQoKSmFuCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
