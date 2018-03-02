From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 4/6] xen/x86: disable global pages for
 domains with XPTI active
Date: Fri, 2 Mar 2018 11:03:04 +0000
Message-ID: <20180302110304.xdwsrossmbdl4hg4@citrix.com>
References: <20180302081403.16953-1-jgross@suse.com>
 <20180302081403.16953-5-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=lugh=fy=citrix.com=prvs=592fbcc37=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eriT2-0000g3-Ih
 for xen-devel@lists.xenproject.org; Fri, 02 Mar 2018 11:03:12 +0000
Content-Disposition: inline
In-Reply-To: <20180302081403.16953-5-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, dfaggioli@suse.com, wei.liu2@citrix.com, jbeulich@suse.com, andrew.cooper3@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXIgMDIsIDIwMTggYXQgMDk6MTQ6MDFBTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBJbnN0ZWFkIG9mIGZsdXNoaW5nIHRoZSBUTEIgZnJvbSBnbG9iYWwgcGFnZXMgd2hl
biBzd2l0Y2hpbmcgYWRkcmVzcwo+IHNwYWNlcyB3aXRoIFhQVEkgYmVpbmcgYWN0aXZlIGp1c3Qg
ZGlzYWJsZSBnbG9iYWwgcGFnZXMgdmlhICVjcjQKPiBjb21wbGV0ZWx5IHdoZW4gYSBkb21haW4g
c3ViamVjdCB0byBYUFRJIGlzIGFjdGl2ZS4gVGhpcyBhdm9pZHMgdGhlCj4gbmVlZCBmb3IgZXh0
cmEgVExCIGZsdXNoZXMgYXMgbG9hZGluZyAlY3IzIHdpbGwgcmVtb3ZlIGFsbCBUTEIKPiBlbnRy
aWVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4K
CkkgdGhpbmsgeW91IHBhdGNoIHRyaWVzIHRvIGRpc2FibGUgUEdFIHdob2xlc2FsZSBmb3IgWGVu
LCBidXQgSSBkb24ndAp0aGluayB0aGlzIHBhdGNoIGNhdGNoZXMgYWxsIG9mIHRoZW0uCgpYRU5f
TUlOSU1BTF9DUjQgc3RpbGwgaGFzIFBHRSBpbiBpdC4gRUZJIHBhdGggYW5kIHRoZSBzdGFjayBy
ZXN5bmNpbmcKYXNtIGluIF9fc3RhcnRfeGVuIGFyZSBtaXNzaW5nLiAKCllvdSBhbHNvIG1pc3Nl
ZCBmaXhpbmcgdGhlIGNvbW1lbnQgb2Ygc2V0dGluZyBNVFJSLiBJdCBpcyBub3QgYSBiaWcgZGVh
bAp0aG91Z2guCgpJIGhhdmUgaW4gZmFjdCB3cml0dGVuIGEgc21hbGwgc2VyaWVzIHRvIG1ha2Ug
Q1I0LlBHRSBjb25maWd1cmFibGUgYnV0CmhhdmVuJ3QgZ290IGFyb3VuZCB0byBzZW5kIHRoZSBw
YXRjaGVzIHlldCBiZWNhdXNlIEkgZGlkbid0IHRoaW5rIGl0IGlzCnZlcnkgdXNlZnVsIGluIGl0
cyBvd24uCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
