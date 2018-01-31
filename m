From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v2 07/12] x86: allow per-domain mappings
 without NX bit or with specific mfn
Date: Wed, 31 Jan 2018 03:30:29 -0700
Message-ID: <5A71A8D502000078001A3F3C@prv-mh.provo.novell.com>
References: <20180122123256.1431-1-jgross@suse.com>
 <20180122123256.1431-8-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=xytx=e2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1egpf2-0006IE-Rq
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2018 10:30:36 +0000
In-Reply-To: <20180122123256.1431-8-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjAxLjE4IGF0IDEzOjMyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBGb3Ig
c3VwcG9ydCBvZiBwZXItdmNwdSBzdGFja3Mgd2UgbmVlZCBwZXItdmNwdSB0cmFtcG9saW5lcy4g
VG8gYmUKPiBhYmxlIHRvIHB1dCB0aG9zZSBpbnRvIHRoZSBwZXItZG9tYWluIG1hcHBpbmdzIHRo
ZSB1cHBlciBsZXZlbHMKPiBwYWdlIHRhYmxlcyBtdXN0IG5vdCBoYXZlIE5YIHNldCBmb3IgcGVy
LWRvbWFpbiBtYXBwaW5ncy4KPiAKPiBJbiBvcmRlciB0byBiZSBhYmxlIHRvIHJlc2V0IHRoZSBO
WCBiaXQgZm9yIGEgcGVyLWRvbWFpbiBtYXBwaW5nIGFkZAo+IGEgaGVscGVyIGZsaXBmbGFnc19w
ZXJkb21haW5fbWFwcGluZygpIGZvciBmbGlwcGluZyBwYWdlIHRhYmxlIGZsYWdzCj4gb2YgYSBz
cGVjaWZpYyBtYXBwZWQgcGFnZS4KPiAKPiBUbyBiZSBhYmxlIHRvIHVzZSBhIHBhZ2UgZnJvbSB4
ZW4gaGVhcCBmb3IgdGhlIGxhc3QgcGVyLXZjcHUgc3RhY2sKPiBwYWdlIGFkZCBhIGhlbHBlciB0
byBtYXAgYW4gYXJiaXRyYXJ5IG1mbiBpbiB0aGUgcGVyZG9tYWluIGFyZWEuCgpPbmUgZnVydGhl
ciByZW1hcmsgb24gdGhpcyBwYXRjaCBhcyBhIHdob2xlOgpjcmVhdGVfcGVyZG9tYWluX21hcHBp
bmcoKSBhbGxvd3MgdGhlIEwxIHRhYmxlcyB0byBiZSByZXR1cm5lZCwKYW5kIEkgdGhpbmsgbWFr
aW5nIHRoaXMgZml0IHlvdXIgbmVlZHMgKGlmIGl0IGRvZXNuJ3QgaW4gaXRzIGN1cnJlbnQKc2hh
cGUpIG1pZ2h0IGJlIGJldHRlciB0aGFuIGludHJvZHVjaW5nIG5ldyBmdW5jdGlvbnMgd2hpY2gg
aW4KdGhlIGVuZCBvbmx5IHdhbnQgdG8gZmlkZGxlIHdpdGggdGhlIEwxIGVudHJpZXMgb2YgcHJl
dmlvdXNseQplc3RhYmxpc2hlZCBtYXBwaW5ncy4gVGhpcyBtaWdodCBhbHNvIGhlbHAgbWFwcGlu
ZyB0aGUgcENQVSdzCkdEVCBpbnRvIHRoZSB2Q1BVJ3MgcGVyLWRvbWFpbiBtYXBwaW5ncyBkdXJp
bmcgY29udGV4dCBzd2l0Y2gsCmFzIHN1Z2dlc3RlZCBlbHNld2hlcmUuCgpKYW4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
