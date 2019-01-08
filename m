From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen/build-id: Fix xen_build_id_check() to
 be robust against malformed notes
Date: Tue, 08 Jan 2019 01:44:46 -0700
Message-ID: <5C3462FE020000780020B2FA@prv1-mh.provo.novell.com>
References: <1546277665-32720-1-git-send-email-andrew.cooper3@citrix.com>
 <5C332BC6020000780020AC6D@prv1-mh.provo.novell.com>
 <9e49a9d5-0079-c3c8-ea21-5085bf7b6d96@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <9e49a9d5-0079-c3c8-ea21-5085bf7b6d96@citrix.com>
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
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjAxLjE5IGF0IDE4OjM0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDcvMDEvMjAxOSAxMDozNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDMx
LjEyLjE4IGF0IDE4OjM0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBB
IE5UX0dOVV9CVUlMRF9JRCB3aXRoIG5hbWVzeiBsb25nZXIgdGhhbiA0IHdpbGwgY2F1c2UgdGhl
IHN0cm5jbXAoKSB0byB1c2UKPj4+IGJ5dGVzIGluIGFkamFjZW50IHN0cmluZ3RhYmxlIGVudHJp
ZXMuCj4+Pgo+Pj4gSW5zdGVhZCwgY2hlY2sgZm9yIG5hbWVzeiBleGFjdGx5IGVxdWFsIHRvIDQs
Cj4+IElzIHRoYXQgYSByZXF1aXJlbWVudCBzcGVsbGVkIG91dCBhbnl3aGVyZT8gVGlsbCBub3cg
SSd2ZSBiZWVuCj4+IHVuZGVyIHRoZSBpbXByZXNzaW9uIHRoYXQgZS5nLiA4IGJ5dGVzIG9mIG5h
bWUgYXJlIGZpbmUgYXMgd2VsbCwKPj4gYXMgbG9uZyBhcyB0aGUgZmlyc3QgZm91ciBvZiB0aGVt
IGFyZSAiR05VXDAiLgo+IAo+IE5vIGlkZWEsIGJ1dCBpZiB0aGlzIGlzIHRydWUgdGhlbiB3ZSd2
ZSBnb3QgYmlnZ2VyIHByb2JsZW1zIHdpdGggcGFyc2luZwo+IHRoZSBub3Rlcy4KCk9rYXksIEkn
dmUgZ29uZSBhbmQgY2hlY2tlZCB0aGUgc3BlYwooaHR0cDovL3d3dy5zY28uY29tL2RldmVsb3Bl
cnMvZ2FiaS9sYXRlc3QvY2g1LnBoZWFkZXIuaHRtbCNub3RlX3NlY3Rpb24pCmFuZCB0byBtZSBp
dCBpcyBub3QgZW50aXJlbHkgdW5hbWJpZ3VvdXMgYnV0IG1hdGNoZXMgdXAgYmV0dGVyCndpdGgg
dGhlIGJlaGF2aW9yIHRoYXQgeW91IHdhbnQgdG8gZXN0YWJsaXNoIHRoYW4gdGhlIG1vcmUKcmVs
YXhlZCBvbmUgSSB3YXMgc3VnZ2VzdGluZy4gSU9XClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+CmFsYmVpdCBJJ2QgbGlrZSB0byBub3RlIHRoYXQgd2UncmUgc3Rp
bGwgbm90IGluIGxpbmUgd2l0aCB0aGUgZG9jIGFib3ZlCmFzIGZhciBhcyBwYWRkaW5nIGlzIGNv
bmNlcm5lZC4gQnV0IHRoZXJlIHdhcyBhIGxlbmd0aHkgZGlzY3Vzc2lvbgpvbiB0aGUgZ0FCSSBt
YWlsaW5nIGxpc3Qgbm90IHNvIGxvbmcgYWdvLCBiZWNhdXNlIHRoZSBzcGVsbGVkIG91dApiZWhh
dmlvciBhbHNvIGlzIG5vdCBpbiBsaW5lIHdpdGggd2hhdCBiaW51dGlscyBkb2VzLCBub3Igd2l0
aCB3aGF0Cm9sZGVyIGdBQkkgdmVyc2lvbnMgZGlkIG1hbmRhdGUuCgpKYW4KCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
