From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH 10/14] x86/mm: Switch {get,
 put}_gfn() infrastructure to using gfn_t
Date: Wed, 21 Nov 2018 16:48:12 +0200
Message-ID: <f993e5a8-9d83-f894-4423-a78c1d3fffd5@bitdefender.com>
References: <1542806482-24030-1-git-send-email-andrew.cooper3@citrix.com>
 <1542806482-24030-11-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542806482-24030-11-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, George Dunlap <george.dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMjEvMTggMzoyMSBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBTZWVtaW5nbHksIGEg
bWFqb3JpdHkgb2YgdXNlcnMgZWl0aGVyIG92ZXJyaWRlIHRoZSBoZWxwZXJzIGFueXdheSwgb3Ig
aGF2ZSBhbgo+IGdmbl90IGluIHRoZWlyIGhhbmRzLgo+IAo+IFVwZGF0ZSB0aGUgQVBJLCBhbmQg
YWRqdXN0IGFsbCB1c2VycyB0byBtYXRjaC4KPiAKPiBEb2luZyB0aGlzIGhpZ2hsaWdodGVkIGEg
Z2FwaW5nIGFsdHAybSBzZWN1cml0eSBob2xlIGluCj4gdm14X3ZjcHVfdXBkYXRlX3ZtZnVuY192
ZSgpLCB3aGljaCB3aWxsIG5lZWQgYWRkcmVzc2luZyBub3cgd2UgY2FuIGRpc2N1c3MgdGhlCj4g
cHJvYmxlbSBhbmQgb3B0aW9ucyBwdWJsaWNseS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKRm9yIHRoZSBtZW1fYWNjZXNzIGJp
dHM6CkFja2VkLWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+
CgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
