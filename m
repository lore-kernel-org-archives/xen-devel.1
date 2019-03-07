From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 0/2] x86: fix build with gcc9
Date: Thu, 07 Mar 2019 04:57:03 -0700
Message-ID: <5C81070F020000780021C759@prv1-mh.provo.novell.com>
References: <5C80F130020000780021C602@prv1-mh.provo.novell.com>
 <alpine.LFD.2.21.1903071132490.4298@algedi.dur.ac.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9kmr=RK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h1re7-0007ww-IJ
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2019 11:57:07 +0000
In-Reply-To: <alpine.LFD.2.21.1903071132490.4298@algedi.dur.ac.uk>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: M A Young <m.a.young@durham.ac.uk>
Cc: Charles Arnold <CARNOLD@suse.com>, Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjAzLjE5IGF0IDEyOjM3LCA8bS5hLnlvdW5nQGR1cmhhbS5hYy51az4gd3JvdGU6
Cj4gT24gVGh1LCA3IE1hciAyMDE5LCBKYW4gQmV1bGljaCB3cm90ZToKPiAKPj4gU2V2ZXJhbCBi
dWlsZCBpc3N1ZXMgKG5ldyB3YXJuaW5ncywgY2F1c2luZyB0aGUgYnVpbGQgdG8gZmFpbCBkdWUg
dG8KPj4gLVdlcnJvcikgaGF2ZSBiZWVuIGZvdW5kLiBUaGUgdHdvIGNoYW5nZXMgaGVyZSBhZGRy
ZXNzIHRoZSBvbmVzCj4+IEkgY2FuIGFjdHVhbGx5IHJlcHJvOyB0aGVyZSBhcmUgYSBmZXcgbW9y
ZSByZWxhdGVkIHRvCj4+IC1XYWRkcmVzcy1vZi1wYWNrZWQtbWVtYmVyIHdoaWNoIEkgaGF2ZW4n
dCBiZWVuIGFibGUgdG8gc2VlCj4+IG15c2VsZiwgYW5kIGhlbmNlIGZvciBub3cgSSdtIHVuYWJs
ZSB0byBzb3J0IG91dCBhIHByb3BlciBmaXggLwo+PiB3b3JrYXJvdW5kIGZvciB0aGVtLgo+IAo+
IEkgZm91bmQgaXNzdWVzIHdpdGggLVdhZGRyZXNzLW9mLXBhY2tlZC1tZW1iZXIgaW4gMyBwbGFj
ZXMgaW4gRmVkb3JhLiBNeSAKPiAocG9zc2libHkgZmxhd2VkKSBhdHRlbXB0IHRvIGZpeCB0aGUg
Z2NjOSBpc3N1ZXMgKG9uIDQuMTEpIGlzIGF0IAo+IGh0dHBzOi8vc3JjLmZlZG9yYXByb2plY3Qu
b3JnL3JwbXMveGVuL2Jsb2IvbWFzdGVyL2YveGVuLmdjYzkuZml4ZXMucGF0Y2ggCgpTbyBoZXJl
IHdlIHNlZSBob3cgZWZmb3J0IGdldHMgZHVwbGljYXRlZDogV2hhdCB3YXMgZm91bmQgaGVyZQpp
bnRlcm5hbGx5IHdhcyBuZXZlciBwb3N0ZWQuIFdoYXQgeW91J3ZlIGZvdW5kIHdhcyBhbHNvIG5l
dmVyCnBvc3RlZC4gV2hvIGtub3dzIGhvdyBtYW55IG1vcmUgZGlzdHJvcyBjYXJyeSBzb21lIGZv
ciBvZiBmaXgKKG9yIHBlcmhhcHMgYmV0dGVyIHdvcmthcm91bmQpIGZvciB0aGlzLiBNYXkgSSBh
c2sgZXZlcnlvbmUgdGhhdApzdWNoIGZpeGVzIGJlIHBvc3RlZCBvbiB4ZW4tZGV2ZWwsIGV2ZW4g
aWYgdGhlIHF1aWNrLWFuZC1kaXJ0eQpzb2x1dGlvbnMgbWF5IG5vdCBiZSB3aGF0IHdlIHdhbnQg
dG8gY29tbWl0PyBJdCdsbCBhdCBsZWFzdCBhbGxvdwpldmVyeW9uZSB0byBrbm93IHdoZXJlIHRo
ZSBpc3N1ZXMgYXJlIGFuZCB0byB0aGluayBvZiBzdWl0YWJsZQpjb2RlIGNoYW5nZXMuCgpBbHNv
IHNhZGx5IHlvdXIgcmVwbHkgZG9lc24ndCByZWFsbHkgaGVscCBtZSB1bmRlcnN0YW5kIHdoeSBJ
J20Kbm90IG15c2VsZiBzZWVpbmcgdGhvc2UgLVdhZGRyZXNzLW9mLXBhY2tlZC1tZW1iZXIgaXNz
dWVzLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
