From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v8] arch/x86: Add registers to vm_event
Date: Thu, 8 Nov 2018 20:45:09 +0000
Message-ID: <20181108204509.rt5uiy357exnt235@zion.uk.xensource.com>
References: <CABfawh=8mksd3_ZO0i=0q44VGoyRj2pHOudczYTfzdH7brZnoQ@mail.gmail.com>
 <a0028d6c-27f6-5e39-c19b-39da0474e276@bitdefender.com>
 <20181108155359.6ihkpw2pd6m7edki@zion.uk.xensource.com>
 <be9410dd-ddd1-db1d-1166-df096c739d1d@bitdefender.com>
 <20181108172201.lzdlkl6wir3b7ypa@zion.uk.xensource.com>
 <af75d830-5a6f-f514-1eca-adce268964fd@bitdefender.com>
 <20181108180231.53r2exdgeepiy56t@zion.uk.xensource.com>
 <4bf400ee-9c3e-a9ac-5a12-149ad5c6e8db@bitdefender.com>
 <20181108182754.4wl7iyfqxvypmazq@zion.uk.xensource.com>
 <b8249ae6-6da8-c512-383f-dbecf6ae3e01@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8d4c=nt=citrix.com=prvs=843a4775a=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gKrAw-0005KE-7F
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 20:45:14 +0000
Content-Disposition: inline
In-Reply-To: <b8249ae6-6da8-c512-383f-dbecf6ae3e01@bitdefender.com>
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

T24gVGh1LCBOb3YgMDgsIDIwMTggYXQgMDg6NDY6MTJQTSArMDIwMCwgUmF6dmFuIENvam9jYXJ1
IHdyb3RlOgo+IE9uIDExLzgvMTggODoyNyBQTSwgV2VpIExpdSB3cm90ZToKPiA+IE9uIFRodSwg
Tm92IDA4LCAyMDE4IGF0IDA4OjIyOjA2UE0gKzAyMDAsIFJhenZhbiBDb2pvY2FydSB3cm90ZToK
PiA+PiBPbiAxMS84LzE4IDg6MDIgUE0sIFdlaSBMaXUgd3JvdGU6Cj4gPj4+IFNwZWFraW5nIG9m
IGJ1aWxkIGJyZWFrYWdlOiB3b3VsZCB5b3UgZ3V5cyBjb25zaWRlciBzaWduaW5nIHVwIHRvIGdp
dGxhYgo+ID4+PiBzbyB0aGF0IHlvdSBjYW4gdXNlIGFsbCB0aGUgYnVpbGQgdGVzdCBpbmZyYXN0
cnVjdHVyZSB0aGVyZSBiZWZvcmUKPiA+Pj4gc3VibWlzc2lvbj8gSXQgd291bGQgcHJvYmFibHkg
c2F5IHlvdSBmcm9tIGJ1aWxkaW5nIGxvY2FsIGZvciBkaWZmZXJlbnQKPiA+Pj4gZGlzdHJvcyBh
bmQgY29uZmlncy4KPiA+Pj4KPiA+Pj4gU2VlIGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVj
dC94ZW4vcGlwZWxpbmVzLzM1OTE4NTEwCj4gPj4KPiA+PiBZZXMsIHRoYXQgZG9lcyBzb3VuZCB2
ZXJ5IGludGVyZXN0aW5nLiBJJ20gbm90IHN1cmUgd2hhdCB0aGF0IGVudGFpbHMgLwo+ID4+IHdo
YXQgdGhlIHByb2NlZHVyZSBpcyB0aG91Z2guIENvdWxkIHlvdSBwbGVhc2UgdGVsbCB1cyBtb3Jl
Pwo+ID4gCj4gPiBUaGUgb25lIEkgc2hvd2VkIHlvdSBpcyB0aGUgdG9wLWxldmVsIHBpcGVsaW5l
LiBUaGVyZSBhcmUgcGVyLWFjY291bnQKPiA+IHBpcGVsaW5lcyBhcyB3ZWxsLgo+ID4gCj4gPiBU
byB1c2UgdGhhdDoKPiA+IAo+ID4gMS4gUmVnaXN0ZXIgYSBHaXRsYWIuY29tIGFjY291bnQKPiA+
IDIuIFRlbGwgbWUgeW91ciBoYW5kbGUocyksIEkgd2lsbCBtYWtlIHlvdSBtZW1iZXIgb2YgdGhl
IHhlbi1wcm9qZWN0IG9yZwo+ID4gMy4gQ3JlYXRlIHlvdXIgb3duIHN1Ymdyb3VwIHVuZGVyIHBl
b3BsZS8KPiA+IDQuIEZvcmsgeGVuLmdpdCBmcm9tIHhlbi1wcm9qZWN0IHRvcC1sZXZlbCByZXBv
c2l0b3J5IGludG8geW91ciBzdWJncm91cAo+ID4gNS4gUHVzaCB5b3VyIGJyYW5jaCB0byB5b3Vy
IHJlcG9zaXRvcnkKPiA+IDYuIEZvdW5kIHRoZSByZXN1bHQgb2YgcGlwZWxpbmUgcnVuIHVuZGVy
IFVSTCBsaWtlOgo+ID4gICAgaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0L3Blb3BsZS9s
aXV3L3hlbi9waXBlbGluZXMKPiA+ICAgICh5b3VyIHByb2JhYmx5IGNhbid0IGFjY2VzcyBpdCBi
ZWNhdXNlIGl0IGlzIHByaXZhdGUpCj4gCj4gV2UnbGwgZG8gdGhhdCwgdGhhbmtzIGZvciB0aGUg
c3VnZ2VzdGlvbiEgU29tZSBvZiBvdXIgdGVhbSBtZW1iZXJzIGFyZQo+IG91dCBvZiBvZmZpY2Ug
YXQgdGhlIG1vbWVudCwgc28gd2UnbGwgZ2V0IGJhY2sgdG8geW91IHdpdGggdGhlaXIKPiBoYW5k
bGVzLiBVbnRpbCB0aGVuLCBtaW5lJ3MgcmF6dmFuLWNvam9jYXJ1LgoKT0suIEJlZm9yZSB5b3Ug
YXNrIGV2ZXJ5b25lIGVsc2UgdG8gc2lnbiB1cCwgbGV0IG1lIGZpZ3VyZSBvdXQgaG93IHRvCmhh
bmRsZSBwZXJtaXNzaW9ucyBjb3JyZWN0bHkgZmlyc3QuCgpXZWkuCgo+IAo+IAo+IFRoYW5rcywK
PiBSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
