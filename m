From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] tools/libxl: mark special pages as
 reserved in e820 map for PVH
Date: Tue, 13 Feb 2018 12:37:07 +0000
Message-ID: <20180213123707.dipfd3fgvp4uafiu@citrix.com>
References: <20171121110606.22809-1-jgross@suse.com>
 <20180213115459.xb42y4gugrmlmjez@citrix.com>
 <beea081b-5567-e0d1-3cfd-862f162dab71@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ira/=fh=citrix.com=prvs=575af4770=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1elZpu-0000ln-Ik
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2018 12:37:26 +0000
Content-Disposition: inline
In-Reply-To: <beea081b-5567-e0d1-3cfd-862f162dab71@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, julien.grall@arm.com, Wei Liu <wei.liu2@citrix.com>, ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBGZWIgMTMsIDIwMTggYXQgMTI6NTc6MzFQTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBPbiAxMy8wMi8xOCAxMjo1NSwgV2VpIExpdSB3cm90ZToKPiA+IE9uIFR1ZSwgTm92
IDIxLCAyMDE3IGF0IDEyOjA2OjA2UE0gKzAxMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gPj4g
VGhlICJzcGVjaWFsIHBhZ2VzIiBmb3IgUFZIIGd1ZXN0cyBpbmNsdWRlIHRoZSBmcmFtZXMgZm9y
IGNvbnNvbGUgYW5kCj4gPj4gWGVuc3RvcmUgcmluZyBidWZmZXJzLiBUaG9zZSBoYXZlIHRvIGJl
IG1hcmtlZCBhcyAiUmVzZXJ2ZWQiIGluIHRoZQo+ID4+IGd1ZXN0J3MgRTgyMCBtYXAsIGFzIG90
aGVyd2lzZSBjb25mbGljdHMgbWlnaHQgYXJpc2UgbGF0ZXIgZS5nLiB3aGVuCj4gPj4gaG90cGx1
Z2dpbmcgbWVtb3J5IGludG8gdGhlIGd1ZXN0Lgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+ID4gCj4gPiBJcyB0aGlzIHBhdGNoIHN0aWxs
IHJlbGV2YW50PyBUaGUgcmVhc29uaW5nIGxvb2tzIHNlbnNpYmxlIHRvIG1lIGZ3aXcuCj4gCj4g
SSBzdGlsbCB0aGluayBpdCBzaG91bGQgYmUgYXBwbGllZCwgeWVzLgoKQWNrZWQgKyBhcHBsaWVk
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
