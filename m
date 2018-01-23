From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4] x86: relocate pvh_info
Date: Tue, 23 Jan 2018 02:14:51 -0700
Message-ID: <5A670B1B02000078001A1694@prv-mh.provo.novell.com>
References: <20180122161304.16886-1-wei.liu2@citrix.com>
 <7cb1090e-5a1c-1bfc-9380-02c40a9d9690@citrix.com>
 <20180122181714.qex27ll46yivg6a7@citrix.com>
 <a5f5090c-e0cf-bf87-388c-390cf567b682@citrix.com>
 <20180122183131.6d3645zm35gduju7@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=2ufb=es=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1edufW-00071O-0N
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2018 09:15:02 +0000
In-Reply-To: <20180122183131.6d3645zm35gduju7@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>, =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjAxLjE4IGF0IDE5OjMxLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gTW9uLCBKYW4gMjIsIDIwMTggYXQgMDY6MTk6NDNQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPj4gT24gMjIvMDEvMTggMTg6MTcsIFdlaSBMaXUgd3JvdGU6Cj4+ID4gU28geW91IHdh
bnQgcmVsb2MubyB0byBjb250YWluIHB2aF9pbmZvX3JlbG9jIHVuY29uZGl0aW9uYWxseT8KPj4g
Pgo+PiA+IEZ1bmRhbWVudGFsbHkgSSBkb24ndCB0aGluayBJIGNhcmUgZW5vdWdoIGFib3V0IGFs
bCB0aGUgYmlrZXNoZWRkaW5nIHNvCj4+ID4gaWYgSmFuIGFuZCB5b3UgYWdyZWUgb24gdGhpcyBJ
IHdpbGwganVzdCBtYWtlIHRoZSBjaGFuZ2UuCj4+IAo+PiBJdCB3b250LiAgVGhlIGZ1bmN0aW9u
IHdpbGwgYmUgZHJvcHBlZCBkdWUgdG8gRENFLCBidXQgd2UnbGwgc3BvdCBidWlsZAo+PiBicmVh
a2FnZXMgZmFyIG1vcmUgZWFzaWx5LiAgKFRoZSBpbXBvcnRhbnQgYml0IGlzIHRoYXQgdGhlIGZ1
bmN0aW9uIGNhbGwKPj4gaXMgZ3VhcmRlZCBieSB0aGUgSVNfRU5BQkxFRCgpKQo+IAo+IHJlbG9j
Lm8gd2lsbCBzdGlsbCBoYXZlIHRoYXQgZnVuY3Rpb24gaW4gbm9uLVBWSCBidWlsZCBvbiBteSBt
YWNoaW5lLgo+IEFuZCB0aGF0J3Mgd2l0aCB0aGUgZm9sbG93aW5nIGRpZmYgYXBwbGllZC4KCldl
bGwsIERDRSBkb2Vzbid0IG1ha2UgYW55IHByb21pc2VzIHRvd2FyZHMgd2hhdCBpdCBpcyBhYmxl
IHRvCmVsaW1pbmF0ZSwgd2hpY2ggaXMgd2h5IGdlbmVyYWxseSBJIHByZWZlciB0byBoZWxwIHRo
ZSBjb21waWxlciBpbgpjYXNlcyBsaWtlIHRoZSBvbmUgaGVyZS4KCkphbgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
