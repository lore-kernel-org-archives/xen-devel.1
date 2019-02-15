From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12 V4] x86/altp2m: fix
 HVMOP_altp2m_set_domain_state race
Date: Fri, 15 Feb 2019 06:46:30 -0700
Message-ID: <5C66C2B6020000780021705A@prv1-mh.provo.novell.com>
References: <1549971734-12795-1-git-send-email-rcojocaru@bitdefender.com>
 <AEB7DEFF-F671-4A5E-AC27-43D314D82741@citrix.com>
 <5C66BDA60200007800217025@prv1-mh.provo.novell.com>
 <64133DD0-7451-43B7-953F-DA38F601E8A4@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Vfmb=QW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gudp6-00067h-5R
 for xen-devel@lists.xenproject.org; Fri, 15 Feb 2019 13:46:36 +0000
In-Reply-To: <64133DD0-7451-43B7-953F-DA38F601E8A4@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: george.dunlap@citrix.com
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAyLjE5IGF0IDE0OjM3LCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPj4gT24gRmViIDE1LCAyMDE5LCBhdCAxOjI0IFBNLCBKYW4gQmV1bGljaCA8SkJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOgo+PiBBbmQgdHdvIGNvc21ldGljIHJlbWFya3MgLSB0aGVyZSdzIG5v
IG5lZWQgdG8gcmUtc3BlY2lmeQo+PiBfX211c3RfY2hlY2sgb24gdGhlIGZ1bmN0aW9uIGRlZmlu
aXRpb24sIGFzIHRoZSBmdW5jdGlvbgo+PiBkZWNsYXJhdGlvbiBvdWdodCB0byBiZSBpbiBzY29w
ZSBhbnl3YXkuIEFuZCB0aGVyZSdzIGEgc3RyYXkKPj4gYmxhbmsgaW5zaWRlIHRoZSBsaWtlbHko
KSB5b3UgYWRkLgo+IAo+IEkgZG9u4oCZdCBzZWUgdGhhdCBJIGFkZGVkIGEg4oCYbGlrZWx54oCZ
OyB0aGVyZeKAmXMgb25lIGluIGNvbnRleHQsIGJ1dCBJIGRvbuKAmXQgc2VlIAo+IGFueSBzdHJh
eSBibGFua3MgdGhlcmUuCgpPaCwgSSdtIHNvcnJ5IC0gYW4gYXJ0aWZhY3QgZnJvbSB0aGUgc3Ry
YW5nZSBmb250IG15IG1haWwgY2xpZW50CnVzZXMgd2hlbiB2aWV3aW5nIGF0dGFjaG1lbnRzLiBJ
dCBsb29rcyBsaWtlIHRoZXJlIGlzIGEgc3BhY2UsCmJ1dCB0aGVyZSByZWFsbHkgaXNuJ3QuCgpK
YW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
