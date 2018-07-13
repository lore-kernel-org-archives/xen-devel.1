From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 02/16] VMX: don't unconditionally set the
 tsc_scaling.setup hook
Date: Fri, 13 Jul 2018 13:17:58 +0100
Message-ID: <b3bd39aa-847d-b1c1-53ca-537b938c1b09@citrix.com>
References: <5B46030502000078001D322E@prv1-mh.provo.novell.com>
 <5B4604E402000078001D3247@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=aqzi=j5=citrix.com=prvs=725a9f4ea=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fdxA1-0002PD-Gj
 for xen-devel@lists.xenproject.org; Fri, 13 Jul 2018 12:26:57 +0000
In-Reply-To: <5B4604E402000078001D3247@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDcvMTggMTQ6MjMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEluc3RlYWQgb2YgY2hlY2tp
bmcgaHZtX3RzY19zY2FsaW5nX3N1cHBvcnRlZCBpbnNpZGUgdGhlIGhvb2sgZnVuY3Rpb24sCj4g
aW5zdGFsbCB0aGUgaG9vayBvbmx5IHdoZW4gc2V0dGluZyBzdGF0ZSBzdWNoIHRoYXQgc2FpZCBw
cmVkaWNhdGUKPiBiZWNvbWVzIHRydWUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
