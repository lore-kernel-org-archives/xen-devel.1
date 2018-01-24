From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] libxl: put RSDP for PVH guest near 4GB
Date: Wed, 24 Jan 2018 14:47:15 +0000
Message-ID: <20180124144715.4m64t2lingum4ejx@citrix.com>
References: <20171201141407.21993-1-jgross@suse.com>
 <cfa0d19b-ace7-4d41-7889-ec9ff6eef85a@suse.com>
 <20180118103330.6ampgvc5ovejzyfp@citrix.com>
 <18edbc21-6661-a236-9369-d3f603b2a03a@oracle.com>
 <CAFLBxZYaoUzqH4OGnn56qjX8KzAWWSVJqToWqRLncVC+kLxvZg@mail.gmail.com>
 <20180124105453.xlaech23qkl6ebni@MacBook-Pro-de-Roger.local>
 <ee015869-6b7d-c12a-4f2f-266c8bccb2d8@suse.com>
 <fc33fe29-9e99-56e5-e064-7fefd28f7fe7@oracle.com>
 <8bada700-d1b0-d1ef-50f0-cff8f6247340@suse.com>
 <09f251da-dc93-ab72-c076-0ab51ad5ac5e@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=vftr=et=citrix.com=prvs=555ec31fe=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eeMKd-0002m8-89
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 14:47:19 +0000
Content-Disposition: inline
In-Reply-To: <09f251da-dc93-ab72-c076-0ab51ad5ac5e@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <dunlapg@umich.edu>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMjQsIDIwMTggYXQgMDk6NDI6NTdBTSAtMDUwMCwgQm9yaXMgT3N0cm92c2t5
IHdyb3RlOgo+IE9uIDAxLzI0LzIwMTggMDk6MjUgQU0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4g
PiBPbiAyNC8wMS8xOCAxNToxMCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+ID4+Cj4gPj4gSSBz
dXNwZWN0IHdlIGNhbiBkbyBhcyBsaXR0bGUgYXMgcmVtb3ZpbmcgIiNpZmRlZiBDT05GSUdfS0VY
RUMiIGFyb3VuZAo+ID4+IGFjcGlfcnNkcCBpbiBkcml2ZXJzL2FjcGkvb3NsLmMgYW5kIHRoZW4g
YXNzaWduaW5nIGl0IHRoZSB2YWx1ZSBpbgo+ID4+IHB2aF9zdGFydF9pbmZvLnJzZHBfcGFkZHIu
IChJIGhhdmVuJ3QgdHJpZWQgaXQpCj4gPiBUaGF0IHdhcyB0aGUgYXBwcm9hY2ggSSBzdGFydGVk
IHdpdGggKG1vcmUgb3IgbGVzcykuIEl0IHdhcyBzZWVuIGFzIGEKPiA+IGxheWVyaW5nIHZpb2xh
dGlvbi4KPiA+Cj4gPiBJJ2QgcmF0aGVyIHRha2UgdGhlIGFwcHJvYWNoIGxpa2UgaW4KPiA+Cj4g
PiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90aXAvdGlw
LmdpdC9jb21taXQvP2g9eDg2L2Jvb3QmaWQ9MGM4OWNmMzY0MjRmN2MxMTc3ZGU4YTU3MTI1MTRk
N2NjMmViMzY5Zgo+ID4KPiA+IGFuZCBoYXZlIGEgUFZIIHNwZWNpZmljIGFjcGlfYXJjaF9nZXRf
cm9vdF9wb2ludGVyKCkgaW5zdGVhZCBvbmUgaW4KPiA+IGFyY2gveDg2L2tlcm5lbC9hY3BpL2Jv
b3QuYy4gVGhpcyBjYW4gbGF0ZXIgYmUgbW9kaWZpZWQgZWFzaWx5IHRvCj4gPiB0YWtlIHRoZSBS
U0RQIGFkZHJlc3MgZnJvbSBib290IHBhcmFtcyBpbnN0ZWFkLgo+IAo+IFN1cmUuCj4gCj4gSW4g
dGhlIG1lYW50aW1lIEkgYXNzdW1lIHRoaXMgcGF0Y2ggd2lsbCBiZSByZXZlcnRlZCBmcm9tIHN0
YWdpbmcgdW50aWwKPiBMaW51eCBpcyB0YWtlbiBjYXJlIG9mPwoKRG8geW91IG1lYW4gd2UgbmVl
ZCB0byB3YWl0IHVudGlsIGFsbCBzdGFibGUga2VybmVscyBnZXQgdGhlIGJhY2twb3J0PwoKV2Vp
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
