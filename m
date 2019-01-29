From: "Jan Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH SpectreV1+L1TF v4 05/11] common/grant_table:
 block speculative out-of-bound accesses
Date: Tue, 29 Jan 2019 02:46:24 -0700
Message-ID: <5C5020F0020000780014B7D1@prv1-mh.provo.novell.com>
References: <1548244285-30813-1-git-send-email-nmanthey@amazon.de>
 <1548244285-30813-6-git-send-email-nmanthey@amazon.de>
 <5C486E0A02000078002106DD@prv1-mh.provo.novell.com>
 <1063c835-3944-48bf-b082-c80ce726a0e6@amazon.de>
 <5C4F1B300200007800211CAE@prv1-mh.provo.novell.com>
 <3eb3ecbb-47a7-386e-90ca-d49d8a75d3a6@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nol9=QF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1goPyR-0003FV-P0
 for xen-devel@lists.xenproject.org; Tue, 29 Jan 2019 09:46:31 +0000
In-Reply-To: <3eb3ecbb-47a7-386e-90ca-d49d8a75d3a6@amazon.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: nmanthey@amazon.de
Cc: tim@xen.org, sstabellini@kernel.org, wei.liu2@citrix.com, konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, Ian.Jackson@eu.citrix.com, Dario Faggioli <dfaggioli@suse.com>, mpohlack@amazon.de, julien.grall@arm.com, dwmw@amazon.co.uk, amazein@amazon.de, xen-devel@lists.xenproject.org, jsteckli@amazon.de, doebel@amazon.de
List-Id: xen-devel@lists.xenproject.org

Pj4+IE5vcmJlcnQgTWFudGhleSA8bm1hbnRoZXlAYW1hem9uLmRlPiAwMS8yOS8xOSA5OjM1IEFN
ID4+Pgo+SSBhbSBhd2FyZSB0aGF0IGJvdGggdmVyc2lvbiB1c2UgdGhlIHNhbWUgYmFzZSBhcnJh
eSwgYW5kIGFjY2VzcyBpdCB2aWEKPmRpZmZlcmVudCBtYWNyb3MsIHdoaWNoIGVzc2VudGlhbGx5
IHBhcnRpdGlvbiB0aGUgYXJyYXkgYmFzZWQgb24gdGhlCj5zaXplIG9mIHRoZSByZXNwZWN0aXZl
IHN0cnVjdC4gVGhlIHVuZGVybHlpbmcgcmF3IGFycmF5IGhhcyB0aGUgc2FtZQo+c2l6ZSBmb3Ig
Ym90aCB2ZXJzaW9uLgoKQW5kIHRoaXMgaXMgdGhlIHByb2JsZW0gYWZhaWNzOiBJZiBhIGd1ZXN0
IGhhcyByZXF1ZXN0ZWQgaXRzIGdyYW50IHRhYmxlIHRvCmJlIHNpemVkIGFzIGEgc2luZ2xlIHBh
Z2UsIHRoaXMgcGFnZSBjYW4gZml0IHR3aWNlIGFzIG1hbnkgZW50cmllcyBmb3IKdjEgdGhhbiBp
dCBjYW4gZml0IGZvciB2Mi4gSGVuY2UgdGhlIHYxIGdyYW50IHJlZmVyZW5jZSBwb2ludGluZyBh
dCB0aGUgbGFzdAplbnRyeSB3b3VsZCBwb2ludCBhdCB0aGUgbGFzdCBlbnRyeSBpbiB0aGUgKG5v
dCBtYXBwZWQpIHNlY29uZCBwYWdlIGZvciB2Mi4KCgpKYW4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
