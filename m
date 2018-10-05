From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH] x86/HVM: move vendor independent CPU
 save/restore logic to shared code
Date: Fri, 5 Oct 2018 15:01:14 +0300
Message-ID: <27e44cce-0fc9-d3db-30fb-608d9388b873@bitdefender.com>
References: <5BB74B9702000078001EECE4@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=/9nw=mr=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1g8OnG-0001pv-Cj
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 12:01:18 +0000
In-Reply-To: <5BB74B9702000078001EECE4@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvNS8xOCAyOjMxIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPiBBIGZldyBwaWVjZXMgb2Yg
dGhlIGhhbmRsaW5nIGhlcmUgYXJlIChubyBsb25nZXI/KSB2ZW5kb3Igc3BlY2lmaWMsIGFuZAo+
IGhlbmNlIHRoZXJlJ3Mgbm8gcG9pbnQgaW4gcmVwbGljYXRpbmcgdGhlIGNvZGUuIE1ha2Ugc3Vy
ZSBub3Qgb3RoZXJ3aXNlCj4gcHJlLWZpbGxlZCBmaWVsZHMgb2Ygc3RydWN0IGh2bV9od19jcHUg
aW5zdGFuY2VzIGFyZSB6ZXJvIGZpbGxlZCBiZWZvcmUKPiBjYWxsaW5nIHRoZSB2ZW5kb3IgInNh
dmUiIGhvb2ssIGVsaW1pbmF0aW5nIHRoZSBuZWVkIGZvciB0aGUgaG9vawo+IGZ1bmN0aW9ucyB0
byB6ZXJvIGluZGl2aWR1YWwgZmllbGRzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KCkFja2VkLWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2Fy
dUBiaXRkZWZlbmRlci5jb20+CgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
