From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 3/3] libxl: fix build (missing
 CLONE_NEWIPC) on astonishingly old systems
Date: Mon, 14 Jan 2019 15:04:34 +0000
Message-ID: <20190114150434.3sifbzsaj4tzqvii@zion.uk.xensource.com>
References: <23608.54527.696432.275991@mariner.uk.xensource.com>
 <20190114145937.16682-3-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Zeoe=PW=citrix.com=prvs=910b68455=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gj3n7-0008FU-Oi
 for xen-devel@lists.xenproject.org; Mon, 14 Jan 2019 15:04:41 +0000
Content-Disposition: inline
In-Reply-To: <20190114145937.16682-3-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMTQsIDIwMTkgYXQgMDI6NTk6MzdQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQ0xPTkVfTkVXSVBDIHdhcyBpbnRyb2R1Y2VkIGluIExpbnV4IDIuNi4xOSwgb24gdGhl
IDI5dGggb2YgTm92ZW1iZXIKPiAyMDA2LCB3aGljaCB3YXMgMTIgeWVhcnMsIDEgbW9udGgsIGFu
ZCAxNCBkYXlzIGFnby4KPiAKPiBOZXZlcnRoZWxlc3MgYXBwYXJlbnRseSBzb21lIHBlb3BsZSBh
cmUgdHJ5aW5nIHRvIGJ1aWxkIFhlbiBvbiBzeXN0ZW1zCj4gd2hvc2Uga2VybmVsIGhlYWRlcnMg
YXJlIHRoYXQgb2xkLiAgUGxhY2F0ZSB0aGVzZSBwZW9wbGUgYnkgcHJvdmlkaW5nCj4gYSBmYWxs
YmFjayAjZGVmaW5lIGZvciBDTE9ORV9ORVdJUEMuCj4gCj4gVGhlIGFjdHVhbCBiaW5hcnkgdmFs
dWUgd2lsbCBvZiBjb3Vyc2UgcmVtYWluIGNvbnN0YW50LCBiZWNhdXNlIG9mIHRoZQo+IGtlcm5l
bCBBUEkgcHJvbWlzZSwgc28gdGhpcyBpcyBhbmQgd2lsbCBiZSBjb3JyZWN0IG9uIGFsbCBwbGF0
Zm9ybXMKPiB3aGVyZSB0aGUgQ0xPTkVfTkVXSVBDIGlzIHN1cHBvcnRlZC4gIChFdmVuIGlmIGZv
ciBzb21lIHJlYXNvbiB3ZSBtaXNzCj4gdGhlIHJpZ2h0ICNpbmNsdWRlcy4pCj4gCj4gT2YgY291
cnNlIGF0IHJ1bnRpbWUgdGhpcyB2YWx1ZSB3aWxsIG5vdCB3b3JrIG9uIG9sZGVyIGtlcm5lbHMu
ICBJdAo+IHdpbGwgYmUgcmVqZWN0ZWQgYXMgdW5rbm93biBieSBhbnl0aGluZyBleGNlcHQgc29t
ZSBwcmUtMi42LjE4Cj4ga2VybmVscy4gIE9uIHRob3NlIGtlcm5lbHMgd2UgZG8gbm90IHdhbnQg
dG8gc3VwcG9ydCBkbV9yZXN0cmljdCwgYW5kCj4gYW4gYXR0ZW1wdCB0byB1c2UgaXQgd2lsbCBm
YWlsLiAgSXQgaXMgT0sgZm9yIHRoZSBmYWlsdXJlIHRvIGJlIGEKPiBtZXNzeSBFSU5WQUwgc3lz
Y2FsbCBmYWlsdXJlLiAgKFRoZSBJUEMgbmFtZXNwYWNlIHVuc2hhcmUgaXMgbmVjZXNzYXJ5Cj4g
dG8gYXZvaWQgYSBzdWJvcm5lZCBkZXByaXZpbGVnZWQgcWVtdSBmcm9tIGNhdXNpbmcgdHJvdWJs
ZSB3aXRoIHNobSwKPiBzZW0sIGV0Yy4pCj4gCj4gT24gdGhlIHZlcnkgb2xkIGtlcm5lbHMsIHRo
ZSBmZWF0dXJlIGlzIHRvdGFsbHkgb3V0IG9mIHNjb3BlLgo+IChXZSBhcmUgb25seSBpbnRlcmVz
dGVkLCBoZXJlLCBpbiBtYWtpbmcgdGhlIGJ1aWxkIHdvcmssIHRvIGF2b2lkCj4gYmxvY2tpbmcg
cGVvcGxlIHdobyBhcmVuJ3QgdXNpbmcgdGhpcyBmZWF0dXJlLikKPiAKPiBDQzogV2VpIExpdSA8
d2VpLmxpdTJAY2l0cml4LmNvbT4KPiBDQzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
Pgo+IENDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
SWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gCgpBY2tlZC1ieTogV2Vp
IExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
