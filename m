From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] xen: Add acpu_sleep=s3_fake command-line
 option for testing
Date: Tue, 22 May 2018 08:17:11 -0600
Message-ID: <5B04266702000078001C4BAC@prv1-mh.provo.novell.com>
References: <20180522133504.11859-1-george.dunlap@citrix.com>
 <5B041DC202000078001C4B2A@prv1-mh.provo.novell.com>
 <a7b19732-c3a3-c918-2a00-29de0b5b87eb@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qj7d=ij=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fL86I-0008QM-5R
 for xen-devel@lists.xenproject.org; Tue, 22 May 2018 14:17:18 +0000
In-Reply-To: <a7b19732-c3a3-c918-2a00-29de0b5b87eb@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: george.dunlap@citrix.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Marek Marczykowski <marmarek@invisiblethingslab.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjA1LjE4IGF0IDE1OjQ4LCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiAwNS8yMi8yMDE4IDAyOjQwIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24g
MjIuMDUuMTggYXQgMTU6MzUsIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4g
LS0tIGEveGVuL2FyY2gveDg2L2FjcGkvcG93ZXIuYwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L2Fj
cGkvcG93ZXIuYwo+Pj4gQEAgLTMzLDYgKzMzLDggQEAKPj4+ICAKPj4+ICB1aW50MzJfdCBzeXN0
ZW1fcmVzZXRfY291bnRlciA9IDE7Cj4+PiAgCj4+PiArc3RhdGljIGJvb2wgX19yZWFkX21vc3Rs
eSBvcHRfZmFrZV9zMyA9IGZhbHNlOwo+PiAKPj4gV2l0aCB0aGUgdHlwbyBpbiB0aGUgdGl0bGUg
KHdhbnRzIHRvIGJlIGFjcGlfc2xlZXApIGNvcnJlY3RlZCAKPiAKPiBPb3BzIC0tIEkgY2FuIGZp
eCB0aGlzIG9uIGNoZWNrLWluIChvbmNlIHRoZSBkZXZlbG9wbWVudCB3aW5kb3cgb3BlbnMpLgo+
IAo+PiBhbmQKPj4gcHJlZmVyYWJseSB3aXRoIHRoZSBwb2ludGxlc3MgaW5pdGlhbGl6ZXIgaGVy
ZSBkcm9wcGVkCj4gCj4gQXJlIGdsb2JhbCB2YXJpYWJsZXMgaW4gQyBhdXRvbWF0aWNhbGx5IGlu
aXRpYWxpemVkPyAgVGhhdCdzIG5ldyB0byBtZQo+IC0tIHVuZGVyIHdoYXQgY2lyY3Vtc3RhbmNl
cywgYW5kIHNpbmNlIHdoZW4/CgpZZXMsIHRoZXkgYXJlIChhbGJlaXQgeW91IG1lYW4gImZpbGUg
c2NvcGUiIGluc3RlYWQgb2YgImdsb2JhbCIgaGVyZSk6CgoiQSBkZWNsYXJhdGlvbiBvZiBhbiBp
ZGVudGlmaWVyIGZvciBhbiBvYmplY3QgdGhhdCBoYXMgZmlsZSBzY29wZSB3aXRob3V0IGFuCiBp
bml0aWFsaXplciwgYW5kIHdpdGhvdXQgYSBzdG9yYWdlLWNsYXNzIHNwZWNpZmllciBvciB3aXRo
IHRoZSBzdG9yYWdlLWNsYXNzCiBzcGVjaWZpZXIgc3RhdGljLCBjb25zdGl0dXRlcyBhIHRlbnRh
dGl2ZSBkZWZpbml0aW9uLiBJZiBhIHRyYW5zbGF0aW9uIHVuaXQKIGNvbnRhaW5zIG9uZSBvciBt
b3JlIHRlbnRhdGl2ZSBkZWZpbml0aW9ucyBmb3IgYW4gaWRlbnRpZmllciwgYW5kIHRoZQogdHJh
bnNsYXRpb24gdW5pdCBjb250YWlucyBubyBleHRlcm5hbCBkZWZpbml0aW9uIGZvciB0aGF0IGlk
ZW50aWZpZXIsIHRoZW4gdGhlCiBiZWhhdmlvciBpcyBleGFjdGx5IGFzIGlmIHRoZSB0cmFuc2xh
dGlvbiB1bml0IGNvbnRhaW5zIGEgZmlsZSBzY29wZQogZGVjbGFyYXRpb24gb2YgdGhhdCBpZGVu
dGlmaWVyLCB3aXRoIHRoZSBjb21wb3NpdGUgdHlwZSBhcyBvZiB0aGUgZW5kIG9mIHRoZQogdHJh
bnNsYXRpb24gdW5pdCwgd2l0aCBhbiBpbml0aWFsaXplciBlcXVhbCB0byAwLiIKCkFzIHRvIHNp
bmNlIHdoZW4gLSBmb3JldmVyLCBJIHdvdWxkIHNheS4gSSBkb24ndCBoYXZlIGEgSyZSIGJvb2sg
dG8gaGFuZAp0aG91Z2ggdG8gc2VlIHdoZXRoZXIgaXQgd2FzIHRoYXQgd2F5IGJhY2sgdGhlbiBh
bHJlYWR5LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
