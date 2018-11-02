From: Julien Grall <julien.grall@arm.com>
Subject: Re: [OSSTEST PATCH] README.hardware-acquisition [and 1
 more messages] [and 2 more messages] [and 2 more messages]
Date: Fri, 2 Nov 2018 16:10:40 +0000
Message-ID: <c2d91264-2a06-cad1-c7f4-b0604b6ff80a@arm.com>
References: <CAFLBxZYyKbw3L0p+a9FbLiHy3icSOTPG+Dndk+L1eZjnxaufaA@mail.gmail.com>
 <alpine.DEB.2.10.1810311138360.7220@sstabellini-ThinkPad-X260>
 <CAFLBxZZtiPxCw8Pz4+3JN81ENjzms+qnQEhHBcbJs9FxEP_QXA@mail.gmail.com>
 <18bf9618-d950-8cfa-1746-e330f3ce0e66@arm.com>
 <alpine.DEB.2.10.1810301528180.22840@sstabellini-ThinkPad-X260>
 <23513.52378.653350.705575@mariner.uk.xensource.com>
 <alpine.DEB.2.10.1810310942530.7220@sstabellini-ThinkPad-X260>
 <23514.62634.413212.853593@mariner.uk.xensource.com>
 <alpine.DEB.2.10.1811011051290.7220@sstabellini-ThinkPad-X260>
 <5F35FB3B-9C4F-467C-8461-5201D0BF5E18@citrix.com>
 <20181102141632.jr4vjefvou5562zd@zion.uk.xensource.com>
 <20181030161326.17879-1-ian.jackson@eu.citrix.com>
 <CAFLBxZabx3rG1t8C+6p-+kojxq1WNOqEXn23GyB+w0OgjDYLiQ@mail.gmail.com>
 <23516.26572.806824.551458@mariner.uk.xensource.com>
 <356dcdbc-3ac9-17dd-9ffe-c792b7bc552d@arm.com>
 <23516.28871.800991.122296@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=6ich=nn=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gIc22-0007L0-45
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 16:10:46 +0000
In-Reply-To: <23516.28871.800991.122296@mariner.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Artem_Mygaiev@epam.com, Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, stefanos@xilinx.com, George Dunlap <dunlapg@umich.edu>, xen-devel@lists.xenproject.org, Stefano Stabellini <stefano.stabellini@xilinx.com>, infra@xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAwMi8xMS8yMDE4IDE1OjQ0LCBJYW4gSmFja3NvbiB3cm90ZToKPiBKdWxpZW4gR3Jh
bGwgd3JpdGVzICgiUmU6IFtPU1NURVNUIFBBVENIXSBSRUFETUUuaGFyZHdhcmUtYWNxdWlzaXRp
b24gW2FuZCAxIG1vcmUgbWVzc2FnZXNdIFthbmQgMiBtb3JlIG1lc3NhZ2VzXSBbYW5kIDIgbW9y
ZSBtZXNzYWdlc10iKToKPj4gT24gMDIvMTEvMjAxOCAxNTowNSwgSWFuIEphY2tzb24gd3JvdGU6
Cj4+PiBJIGd1ZXNzIHRoYXQncyBwcm9iYWJseSB0b2xlcmFibGUuICBXZSdkIGhhdmUgdG8gdGhp
bmsgYWJvdXQgd2hldGhlcgo+Pj4gd2Ugc2hvdWxkIHNuYXBzaG90IHRoZW0sIG9yIGluc3RhbGwg
dGhlbSBkaXJlY3RseSBmcm9tIHVwc3RyZWFtLiAgVGhlCj4+PiBsYXR0ZXIgaXMgbGVzcyBjb2Rp
bmcgZWZmb3J0IGluIG9zc3Rlc3QgKGp1c3QgYWRkIGFuIGFwdCBzb3VyY2UgYW5kCj4+PiBydW4g
dGhlIGluc3RhbGwgcnVuZSBJIGd1ZXNzKSBidXQgaXQgd291bGQgaW1wbHkgdHJhY2tpbmcgdGhl
c2UgaW4gYW4KPj4+IHVuY29udHJvbGxlZCB3YXksIHNvIHdlIHdvdWxkIHdhbnQgdG8gYmUgY29u
ZmlkZW50IHRoYXQgdGhleSBhcmUKPj4+IG1haW50YWluZWQgdG8gYSBoaWdoIHN0YW5kYXJkLCBz
aW5jZSBwcm9ibGVtcyB3aXRoIHRoZSBjb21waWxlciB3b3VsZAo+Pj4gYnJlYWsgZXZlcnl0aGlu
ZyBmb3IgdXMuICBBbHNvIEkgd291bGQgYXNrOiBob3cgcmVsaWFibGUgaXMgdGhlaXIgYXB0Cj4+
PiByZXBvc2l0b3J5IGhvc3RpbmcgPyAgSWYgaXQgZ29lcyBkb3duLCBsaWtld2lzZSwgZXZlcnl0
aGluZyB3b3VsZAo+Pj4gYnJlYWsgZm9yIHVzLgo+Pgo+PiBMaW5hcm8gaG9zdGluZyBpcyBwcmV0
dHkgcmVsaWFibGUuIEJ1dCBBRkFJSywgdGhleSBkb24ndCBoYXZlIGFuIGFwdCByZXBvIGZvcgo+
PiB0aGUgdG9vbGNoYWlucy4gV2Ugd291bGQgbmVlZCB0byBkb3dubG9hZCBhIHRhcmJhbGwgYW5k
IHVucGFjayBpdC4KPiAKPiBUaGF0IHdvdWxkIGJlIGRvYWJsZS4gIElmIHRoZSB0YXJiYWxscyBo
YXZlIHZlcnNpb25zIHdlIGNvdWxkIHB1dCB0aGUKPiB2ZXJzaW9uIG51bWJlciBpbiB0aGUgb3Nz
dGVzdCBjb25maWcgYW5kIHRoZW4gaXQgd291bGQgYmUgcHVzaCBnYXRlZC4KPiAKPj4+IFBlcmhh
cHMgSnVsaWVuIGhhcyB0aW1lIHRvIGRvIHRoYXQuCj4+Cj4+IEFybTY0IGNyb3NzLWNvbXBpbGVy
IGluIERlYmlhbiBzaG91bGQgYmUgc3VpdGFibGUgZW5vdWdoIGZvciBidWlsZGluZyB0aGUKPj4g
a2VybmVsLiBJZiB0aGVyZSBhcmUgYW55IGlzc3VlIHdpdGggdGhlbSwgdGhlbiBhIGJ1ZyByZXBv
cnQgc2hvdWxkIGJlIGZpbGxlZC4KPiAKPiBPSywgdGhhdCdzIGRlZmluaXRlbHkgZ29pbmcgdG8g
YmUgZWFzaWVyIHRoZW4uCj4gCj4+IE15IHByZWZlcmVuY2UgaXMgdG8gYXZvaWQgY3Jvc3MtY29t
cGlsaW5nIGlmIHdlIGNhbi4gVGhpcyB3b3VsZCBhdm9pZCB0byB1c2UgeDg2Cj4+IHJlc291cmNl
IGZvciBidWlsZGluZyBrZXJuZWwgdGhhdCBjb3VsZCBiZSByZS11c2VkIGZvciB0ZXN0aW5nIFhl
biBpdHNlbGYuCj4gCj4gV2UgaGF2ZSBtb3JlIHg4NiBjYXBhY2l0eSBhbmQgYXJlIGRlcGxveWlu
ZyBzb21lIGRlZGljYXRlZCBidWlsZAo+IGhvc3RzLiAgQnV0IGNyb3NzLWNvbXBpbGF0aW9uIGlz
IG1vcmUgY29tcGxleCAocGFydGljdWxhcmx5IHRoZQo+IGNvbXBpbGVyIGNvbmZsaWN0Li4uKQoK
RG8geW91IG1lYW4gdGhlIG11bHRpbGliIHByb2JsZW0/IFRoaXMgaXNzdWUgaXMgb25seSB3aGVu
IGNyb3NzLWNvbXBpbGluZyB0b29scyAKKHdoaWNoIEkgd291bGQgbm90IHJlY29tbWVuZCBhbnl3
YXkuLi4pLiBGb3IgdGhpbmdzIGxpa2Uga2VybmVsIGFuZCBoeXBlcnZpc29yLCAKeW91IGRvbid0
IG5lZWQgbXVsdGlsaWIuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
