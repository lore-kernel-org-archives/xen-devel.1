From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 11/16] x86: don't set sysenter_entry in
 vmcs when !CONFIG_PV
Date: Fri, 2 Nov 2018 14:05:21 +0000
Message-ID: <20181102140521.ovkqowatsuak4sa2@zion.uk.xensource.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
 <7298eaf9e6174052e0fa5a629ca2cc8664996efb.1539959287.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=1awx=nn=citrix.com=prvs=837bb29b5=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gIa4m-0002mq-2d
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 14:05:28 +0000
Content-Disposition: inline
In-Reply-To: <7298eaf9e6174052e0fa5a629ca2cc8664996efb.1539959287.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBPY3QgMTksIDIwMTggYXQgMDM6Mjg6MzdQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBUaGUgc3ltYm9sIHdpbGwgbm90IGJlIGF2YWlsYWJsZSB3aGVuIFBWIGlzIGRpc2FibGVkLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpJbiBsaWdo
dCBvZiB0aGUgZGlzY3Vzc2lvbiBvZiB0aGUgcHJldmlvdXMgcGF0Y2gsIGEgc3R1YiBmb3IKc3lz
ZW50ZXJfZW50cnkgd2lsbCBiZSBwcm92aWRlZCwgc28gdGhpcyBwYXRjaCBjYW4gYmUgZHJvcHBl
ZC4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
