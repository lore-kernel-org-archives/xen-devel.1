From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 11/16] x86: don't set sysenter_entry in
 vmcs when !CONFIG_PV
Date: Fri, 02 Nov 2018 08:32:11 -0600
Message-ID: <5BDC5FEB02000078001F749E@prv1-mh.provo.novell.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
 <7298eaf9e6174052e0fa5a629ca2cc8664996efb.1539959287.git-series.wei.liu2@citrix.com>
 <20181102140521.ovkqowatsuak4sa2@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wbrw=nn=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gIaUh-0005oF-Vx
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 14:32:16 +0000
In-Reply-To: <20181102140521.ovkqowatsuak4sa2@zion.uk.xensource.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjExLjE4IGF0IDE1OjA1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gRnJpLCBPY3QgMTksIDIwMTggYXQgMDM6Mjg6MzdQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
Pj4gVGhlIHN5bWJvbCB3aWxsIG5vdCBiZSBhdmFpbGFibGUgd2hlbiBQViBpcyBkaXNhYmxlZC4K
Pj4gCj4+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gCj4g
SW4gbGlnaHQgb2YgdGhlIGRpc2N1c3Npb24gb2YgdGhlIHByZXZpb3VzIHBhdGNoLCBhIHN0dWIg
Zm9yCj4gc3lzZW50ZXJfZW50cnkgd2lsbCBiZSBwcm92aWRlZCwgc28gdGhpcyBwYXRjaCBjYW4g
YmUgZHJvcHBlZC4KCkFzIHNhaWQgLSBTWVNFTlRFUiBpcyBmaW5lIHdpdGhvdXQgc3R1YiwgZHVl
IHRvIGl0cyBkaWZmZXJlbnQKZmF1bHRpbmcgY29uZGl0aW9ucyBjb21wYXJlZCB0byBTWVNDQUxM
LiBKdXN0IHplcm8gdGhlCnJlc3BlY3RpdmUgTVNSKHMpLgoKSmFuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
