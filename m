From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 07/15] argo: implement the register op
Date: Mon, 14 Jan 2019 15:31:02 +0000
Message-ID: <6f2f6778-7316-af79-3b1c-82fc0771e17f@citrix.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-8-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=E1pU=PW=citrix.com=prvs=910aa9826=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gj4Ci-0002h3-MC
 for xen-devel@lists.xenproject.org; Mon, 14 Jan 2019 15:31:08 +0000
In-Reply-To: <1546846968-7372-8-git-send-email-christopher.w.clark@gmail.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDEvMjAxOSAwNzo0MiwgQ2hyaXN0b3BoZXIgQ2xhcmsgd3JvdGU6Cj4gZGlmZiAtLWdp
dCBhL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYyBiL2RvY3MvbWlzYy94ZW4tY29t
bWFuZC1saW5lLnBhbmRvYwo+IGluZGV4IGFlYTEzZWIuLjY4ZDQ0MTUgMTAwNjQ0Cj4gLS0tIGEv
ZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jCj4gKysrIGIvZG9jcy9taXNjL3hlbi1j
b21tYW5kLWxpbmUucGFuZG9jCj4gQEAgLTE5Myw2ICsxOTMsMjEgQEAgVGhpcyBhbGxvd3MgZG9t
YWlucyBhY2Nlc3MgdG8gdGhlIEFyZ28gaHlwZXJjYWxsLCB3aGljaCBzdXBwb3J0cyByZWdpc3Ry
YXRpb24KPiAgb2YgbWVtb3J5IHJpbmdzIHdpdGggdGhlIGh5cGVydmlzb3IgdG8gcmVjZWl2ZSBt
ZXNzYWdlcywgc2VuZGluZyBtZXNzYWdlcyB0bwo+ICBvdGhlciBkb21haW5zIGJ5IGh5cGVyY2Fs
bCBhbmQgcXVlcnlpbmcgdGhlIHJpbmcgc3RhdHVzIG9mIG90aGVyIGRvbWFpbnMuCj4gIAo+ICsj
IyMgYXJnby1tYWMKPiArPiBgPSBwZXJtaXNzaXZlIHwgZW5mb3JjaW5nYAoKQXJlIHRoZXNlIGNv
bW1hbmQgbGluZSBvcHRpb25zIGFscmVhZHkgaW4gdXNlIGluIHRoZSBPcGVuWFQgY29tbXVuaXR5
PwoKSSBhc2ssIGJlY2F1c2Ugd2UgYXJlIHRyeWluZyB0byBhdm9pZCBnYWluaW5nIG11bHRpcGxl
IHRvcCBsZXZlbCBvcHRpb25zCmZvciByZWxhdGVkIGZ1bmN0aW9uYXRsaXkuCgpJTU8sIHRoaXMg
ZnVuY3Rpb25hbGl0eSBjb3VsZCBiZSBjb3ZlcmVkIG1vcmUgc3VjY2luY3RseSB3aXRoOgoKwqAg
YXJnbyA9IExpc3Qgb2YgWyA8Ym9vbD4sIG1hYyA9IHBlcm1pc3NpdmUgfCBlbmZvcmNpbmcgXQoK
d2hpY2ggYWxzbyBhbGxvd3MgZm9yIGNsZWFuZXIgYWRkaXRpb24gb2YgZnV0dXJlIG9wdGlvbnMu
CgooVW5mb3J0dW5hdGVseSwgdG8gaW1wbGVtZW50IHRoaXMsIHlvdSBuZWVkIG15IGNtZGxpbmVf
c3RyY21wKCkgZml4ZXMsCndoaWNoIGFyZSBzdGlsbCBwZW5kaW5nIGFuIGFjay4pCgp+QW5kcmV3
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
