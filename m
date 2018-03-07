From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: Setting up a Xen x86 community call
Date: Wed, 7 Mar 2018 15:45:20 +0100
Message-ID: <20180307144520.GN20614@olila.local.net-space.pl>
References: <B2025C1A-199C-4019-9ECF-AFF34FE8D702@gmail.com>
 <83E88477-F05E-4317-8643-85F54521BD78@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=rlpf=f5=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1etaSk-0002eN-Uy
 for xen-devel@lists.xenproject.org; Wed, 07 Mar 2018 14:54:39 +0000
Content-Disposition: inline
In-Reply-To: <83E88477-F05E-4317-8643-85F54521BD78@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth.xen@gmail.com>
Cc: Chao Peng <chao.p.peng@linux.intel.com>, Kevin Tian <kevin.tian@intel.com>, tamas@tklengyel.com, Razvan Cojocaru <rcojocaru@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 'Susie Li' <susie.li@intel.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <royger@freebsd.org>, Christopher Clark <christopher.w.clark@gmail.com>, John Ji <john.ji@intel.com>, Babu Moger <Babu.Moger@amd.com>, Rich Persaud <persaur@gmail.com>, paul.durrant@citrix.com, committers@xenproject.org, Janakarajan Natarajan <jnataraj@amd.com>, Jan Beulich <jbeulich@suse.com>, "Hurwitz, Sherry" <sherry.hurwitz@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, joao.m.martins@oracle.com, Brian Woods <brian.woods@amd.com>, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMDcsIDIwMTggYXQgMDE6Mjc6NDVQTSArMDEwMCwgTGFycyBLdXJ0aCB3cm90
ZToKPiBIaSBhbGwsCj4KPiB0aGFua3MgZm9yIHRoZSBmZWVkYmFjay4gSXQgc2VlbXMgdG8gbWUg
dGhhdCB0aGUgZm9sbG93aW5nIHRpbWVzIHNhdGlzZnkgYWxsIHJlcXVpcmVtZW50cy4KPiBUaG9z
ZSB3aXRoIG1pbm9yIGlzc3VlcyBhcmUgb24gdGhlIFRPIGxpc3QgYW5kIGNhbGxlZCBvdXQgYmVs
b3cuCj4KPiBXaW50ZXIKPiA9PT09PT0KPiAxNTowMCAtIDE2OjAwIFVUQwo+IDA3OjAwIC0gMDg6
MDAgUGFjaWZpYwo+IDA5OjAwIC0gMTA6MDAgQXVzdGluCj4gMTA6MDAgLSAxMTowMCBOZXcgWW9y
awo+IDE1OjAwIC0gMTY6MDAgTG9uZG9uCj4gMTY6MDAgLSAxNzowMCBCZXJsaW4KPiAyMzowMCAt
IDI0OjAwIEJlaWppbmcKPgo+IFN1bW1lcgo+ID09PT09PQo+IDE0OjAwIC0gMTU6MDAgVVRDCj4g
MDc6MDAgLSAwODowMCBQYWNpZmljCj4gMDk6MDAgLSAxMDowMCBBdXN0aW4KPiAxMDowMCAtIDEx
OjAwIE5ldyBZb3JrCj4gMTU6MDAgLSAxNjowMCBMb25kb24KPiAxNjowMCAtIDE3OjAwIEJlcmxp
bgo+IDIyOjAwIC0gMjM6MDAgQmVpamluZwo+Cj4gU2VlIGh0dHBzOi8vd3d3LnRpbWVhbmRkYXRl
LmNvbS90aW1lL2RzdC9ldmVudHMuaHRtbCBmb3Igc3VtbWVyIHRpbWUgY2hhbmdlcyBzcGVjaWZp
YyBjb3VudHJpZXMKPgo+IFRoZSBpbmZvcm1hdGlvbiBpcyBhbHNvIGNvbGxhdGVkIGluIGh0dHBz
Oi8vZG9jcy5nb29nbGUuY29tL3NwcmVhZHNoZWV0cy9kLzFKUlR5NnU2WmZ3Zk4wd1JuVzc5Ykp0
S3ZNaE1EVGNRSXV0cEx6NEdkekZvL2VkaXQ/dXNwPXNoYXJpbmcgKHRoZSBzZWNvbmQgdGFiIHNo
b3dzIGEgc25pcHBldCBvZiB0aGUgd29ybGQgY2xvY2spCj4KPiBKYW4gQmV1bGljaDoKPiBPbmx5
IFdlZCB1cCB0byAxNzowMAo+Cj4gRGFuaWVsIEtpcGVyOgo+IENhbid0IGRvIHRoaXMgc2xvdCBv
biBUdWVzZGF5LCBhbmQgbm90IFRodXJzZGF5Cj4gQnV0IEkgYW0gYXNzdW1pbmcgV2VkIG1heSB3
b3JrLgoKWWVwLCBJIGFtIE9LIHdpdGggdGhhdC4KCkRhbmllbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
