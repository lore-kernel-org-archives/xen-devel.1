From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen/sched: Re-position the
 domain_update_node_affinity() call during vcpu construction
Date: Fri, 07 Sep 2018 02:33:22 -0600
Message-ID: <5B9237D202000078001E6358@prv1-mh.provo.novell.com>
References: <1536242495-21173-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1536242495-21173-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Xen-devel <xen-devel@lists.xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA2LjA5LjE4IGF0IDE2OjAxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gYWxsb2NfdmNwdSgpJ3MgY2FsbCB0byBkb21haW5fdXBkYXRlX25vZGVfYWZmaW5pdHko
KSBoYXMgZXhpc3RlZCBmb3IgYSBkZWNhZGUsCj4gYnV0IGl0cyBlZmZvcnQgaXMgbW9zdGx5IHdh
c3RlZC4KPiAKPiBhbGxvY192Y3B1KCkgaXMgY2FsbGVkIGluIGEgbG9vcCBmb3IgZWFjaCB2Y3B1
LCBicmluZ2luZyB0aGVtIGludG8gZXhpc3RlbmNlLgo+IFRoZSB2YWx1ZXMgb2YgdGhlIGFmZmlu
aXR5IG1hc2tzIGFyZSBzdGlsbCBkZWZhdWx0LCB3aGljaCBpcyBhbGxjcHVzIGluCj4gZ2VuZXJh
bCwgb3IgYSBwcm9jZXNzb3Igc2luZ2xldG9uIGZvciBwaW5uZWQgZG9tYWlucy4KPiAKPiBGdXJ0
aGVybW9yZSwgZG9tYWluX3VwZGF0ZV9ub2RlX2FmZmluaXR5KCkgaXRzZWxmIGxvb3BzIG92ZXIg
YWxsIHZjcHVzCj4gYWNjdW11bGF0aW5nIHRoZSBtYXNrcywgbWFraW5nIGl0IGEgc2NhbGFiaWxp
dHkgY29uY2VybiB3aXRoIGxhcmdlIG51bWJlcnMgb2YKPiB2Y3B1cy4KPiAKPiBNb3ZlIGl0IHRv
IGJlIGNhbGxlZCBvbmNlIGFmdGVyIGFsbCB2Y3B1cyBhcmUgY29uc3RydWN0ZWQsIHdoaWNoIGhh
cyB0aGUgc2FtZQo+IG5ldCBlZmZlY3QsIGJ1dCB3aXRoIGZld2VyIGludGVybWVkaWF0ZSBtZW1v
cnkgYWxsb2NhdGlvbnMgYW5kIGxlc3MgY3B1bWFzawo+IGFyaXRobWV0aWMuCj4gCj4gU2lnbmVk
LW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJldmll
d2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
