From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v1] x86/hvm: Clean up may_defer from hvm_*
 helpers
Date: Thu, 1 Nov 2018 12:31:40 +0200
Message-ID: <73ab7fcd-59da-f160-3eda-a799349585a3@bitdefender.com>
References: <20181024091849.15572-1-aisaila@bitdefender.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19BE2B9E0@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kl4z=nm=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gIAGQ-0005NF-6g
 for xen-devel@lists.xenproject.org; Thu, 01 Nov 2018 10:31:46 +0000
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19BE2B9E0@SHSMSX101.ccr.corp.intel.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Tian, Kevin" <kevin.tian@intel.com>, Alexandru Stefan ISAILA <aisaila@bitdefender.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "tamas@tklengyel.com" <tamas@tklengyel.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "paul.durrant@citrix.com" <paul.durrant@citrix.com>, "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, "brian.woods@amd.com" <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMzAvMTggODoxOSBBTSwgVGlhbiwgS2V2aW4gd3JvdGU6Cj4+IEZyb206IEFsZXhhbmRy
dSBTdGVmYW4gSVNBSUxBIFttYWlsdG86YWlzYWlsYUBiaXRkZWZlbmRlci5jb21dCj4+IFNlbnQ6
IFdlZG5lc2RheSwgT2N0b2JlciAyNCwgMjAxOCA1OjE5IFBNCj4+Cj4+IFRoZSBtYXlfZGVmZXIg
dmFyIHdhcyBsZWZ0IHdpdGggdGhlIG9sZGVyIGJvb2xfdCB0eXBlLiBUaGlzIHBhdGNoCj4+IGNo
YW5nZXMgdGhlIHR5cGUgdG8gYm9vbC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElz
YWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IEtldmluIFRp
YW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgoKSSB0aGluayB0aGlzIHRyaXZpYWwgcGF0Y2ggaGFz
IGFsbCB0aGUgYWNrcyBpdCBuZWVkcyB0byBnbyBpbj8KCgpUaGFua3MsClJhenZhbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
