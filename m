From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v8] arch/x86: Add registers to vm_event
Date: Thu, 8 Nov 2018 18:02:31 +0000
Message-ID: <20181108180231.53r2exdgeepiy56t@zion.uk.xensource.com>
References: <20181105095354.9082-1-aisaila@bitdefender.com>
 <CABfawh=8mksd3_ZO0i=0q44VGoyRj2pHOudczYTfzdH7brZnoQ@mail.gmail.com>
 <a0028d6c-27f6-5e39-c19b-39da0474e276@bitdefender.com>
 <20181108155359.6ihkpw2pd6m7edki@zion.uk.xensource.com>
 <be9410dd-ddd1-db1d-1166-df096c739d1d@bitdefender.com>
 <20181108172201.lzdlkl6wir3b7ypa@zion.uk.xensource.com>
 <af75d830-5a6f-f514-1eca-adce268964fd@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8d4c=nt=citrix.com=prvs=843a4775a=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gKoe2-0007sD-6u
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 18:03:06 +0000
Content-Disposition: inline
In-Reply-To: <af75d830-5a6f-f514-1eca-adce268964fd@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Alexandru Isaila <aisaila@bitdefender.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMDgsIDIwMTggYXQgMDc6NTY6MjlQTSArMDIwMCwgUmF6dmFuIENvam9jYXJ1
IHdyb3RlOgo+IE9uIDExLzgvMTggNzoyMiBQTSwgV2VpIExpdSB3cm90ZToKPiA+IE9uIFRodSwg
Tm92IDA4LCAyMDE4IGF0IDA1OjU2OjA3UE0gKzAyMDAsIFJhenZhbiBDb2pvY2FydSB3cm90ZToK
PiA+PiBPbiAxMS84LzE4IDU6NTMgUE0sIFdlaSBMaXUgd3JvdGU6Cj4gPj4+IE9uIFRodSwgTm92
IDA4LCAyMDE4IGF0IDA1OjE5OjQ4UE0gKzAyMDAsIFJhenZhbiBDb2pvY2FydSB3cm90ZToKPiA+
Pj4+IE9uIDExLzYvMTggNzoxNiBQTSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+ID4+Pj4+IE9u
IE1vbiwgTm92IDUsIDIwMTggYXQgMjo1NCBBTSBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQQo+ID4+
Pj4+IDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4gPj4+Pj4+Cj4gPj4+Pj4+IFRo
aXMgcGF0Y2ggYWRkcyBhIGNvdXBsZSBvZiByZWdzIHRvIHRoZSB2bV9ldmVudCB0aGF0IGFyZSB1
c2VkIGJ5Cj4gPj4+Pj4+IHRoZSBpbnRyb3NwZWN0aW9uLiBUaGUgYmFzZSwgbGltaXQgYW5kIGFy
Cj4gPj4+Pj4+IGJpdHMgYXJlIGNvbXByZXNzZWQgaW50byBhIHVpbnQ2NF90IHVuaW9uIHNvIGFz
IG5vdCB0byBlbmxhcmdlIHRoZQo+ID4+Pj4+PiB2bV9ldmVudC4KPiA+Pj4+Pj4KPiA+Pj4+Pj4g
U2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+
Cj4gPj4+Pj4KPiA+Pj4+PiBBY2tlZC1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5
ZWwuY29tPgo+ID4+Pj4KPiA+Pj4+IFRvIHRoZSBiZXN0IG9mIG15IGFiaWxpdHkgdG8gZmlndXJl
IG91dCB0aGUgbmVjZXNzYXJ5IGFja3MsIEkgYmVsaWV2ZQo+ID4+Pj4gdGhhdCB0aGlzIG9uZSBp
cyByZWFkeSB0byBnbyBpbi4gOikKPiA+Pj4KPiA+Pj4gQWxyaWdodC4gSSB3aWxsIHBpY2sgdGhp
cyB1cCBpbiBteSBuZXh0IHN3ZWVwLgo+ID4+Cj4gPj4gVGhhbmtzIQo+ID4gCj4gPiAKPiA+IFVu
Zm9ydHVuYXRlbHkgdGhpcyB3aWxsIGJyZWFrIHNoaW0gYnVpbGQgd2hlbiBIVk0gaXMgZGlzYWJs
ZWQuIFBsZWFzZQo+ID4gc3VibWl0IGEgbmV3IHZlcnNpb24uIEkgdGhpbmsgeW91IHdpbGwgbmVl
ZCB0byBwdXQKPiA+IHZtX2V2ZW50X3BhY2tfc2VnbWVudF9yZWdpc3RlciB1bmRlciBDT05GSUdf
SFZNLgo+IAo+IFZlcnkgc29ycnkgYWJvdXQgdGhhdC4gV2UnbGwgcmVzdWJtaXQuCgpTcGVha2lu
ZyBvZiBidWlsZCBicmVha2FnZTogd291bGQgeW91IGd1eXMgY29uc2lkZXIgc2lnbmluZyB1cCB0
byBnaXRsYWIKc28gdGhhdCB5b3UgY2FuIHVzZSBhbGwgdGhlIGJ1aWxkIHRlc3QgaW5mcmFzdHJ1
Y3R1cmUgdGhlcmUgYmVmb3JlCnN1Ym1pc3Npb24/IEl0IHdvdWxkIHByb2JhYmx5IHNheSB5b3Ug
ZnJvbSBidWlsZGluZyBsb2NhbCBmb3IgZGlmZmVyZW50CmRpc3Ryb3MgYW5kIGNvbmZpZ3MuCgpT
ZWUgaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0L3hlbi9waXBlbGluZXMvMzU5MTg1MTAK
CldlaS4KCj4gCj4gCj4gVGhhbmtzLAo+IFJhenZhbgo+IAo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+IFhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
