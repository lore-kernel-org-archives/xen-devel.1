From: Wim ten Have <wim.ten.have@oracle.com>
Subject: Re: [PATCH v3 1/2] libxl: Implement the handler to
 handle unrecoverable AER errors [and 1 more messages]
Date: Tue, 3 Apr 2018 17:28:24 +0200
Message-ID: <20180403172824.7d730a8c.wim.ten.have@oracle.com>
References: <20180402162536.3134-1-venu.busireddy@oracle.com>
 <20170807235457.3943-1-venu.busireddy@oracle.com>
 <20170807235457.3943-2-venu.busireddy@oracle.com>
 <20170808143301.5kyqlbomcyr3wa4o@citrix.com>
 <20170808145136.GA15728@vbusired-lt>
 <22979.62230.829267.882579@mariner.uk.xensource.com>
 <23235.39017.980437.46925@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <23235.39017.980437.46925@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wim ten Have <wim.ten.have@oracle.com>, xen-devel@lists.xen.org, Venu Busireddy <venu.busireddy@oracle.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAzIEFwciAyMDE4IDE2OjA2OjE3ICswMTAwCklhbiBKYWNrc29uIDxpYW4uamFja3Nv
bkBjaXRyaXguY29tPiB3cm90ZToKCj4gVmVudSBCdXNpcmVkZHkgd3JpdGVzICgiW1JFU0VORCBQ
QVRDSCB2NSAwLzJdIENvbnRhaW5pbmcgQUVSIHVucmVjb3ZlcmFibGUgZXJyb3JzIik6Cj4gPiBU
aGlzIHBhdGNoIHNldCBpcyBwYXJ0IG9mIGEgc2V0IG9mIHBhdGNoZXMgdGhhdCB0b2dldGhlciBh
bGxvdyBjb250YWlubWVudAo+ID4gb2YgdW5yZWNvdmVyYWJsZSBBRVIgZXJyb3JzIGZyb20gUENJ
ZSBkZXZpY2VzIGFzc2lnbmVkIHRvIGd1ZXN0cyBpbgo+ID4gcGFzc3Rocm91Z2ggbW9kZS4gVGhl
IGNvbnRhaW5tZW50IGlzIGFjaGlldmVkIGJ5IGZvcmNpYmx5IHJlbW92aW5nIHRoZQo+ID4gZXJy
aW5nIFBDSWUgZGV2aWNlIGZyb20gdGhlIGd1ZXN0LiAgCj4gCj4gQnV0LCBpbiBTZXB0ZW1iZXIs
IEkgd3JvdGU6Cj4gCj4gSWFuIEphY2tzb24gd3JpdGVzICgiUmU6IFtQQVRDSCB2MyAxLzJdIGxp
YnhsOiBJbXBsZW1lbnQgdGhlIGhhbmRsZXIgdG8gaGFuZGxlIHVucmVjb3ZlcmFibGUgQUVSIGVy
cm9ycyIpOgo+ID4gSSdtIGFmcmFpZCB0aGF0IEkgc3RpbGwgaGF2ZSByZXNlcnZhdGlvbnMgYWJv
dXQgdGhlIGRlc2lnbiBxdWVzdGlvbnMuCj4gPiBFdmlkZW50bHkgSSBkaWRuJ3QgbWFrZSBteSBx
dWVzdGlvbnMgY2xlYXIgZW5vdWdoLgo+ID4gCj4gPiBbIDY0IGxpbmVzIG9mIGRldGFpbGVkIGRp
c2N1c3Npb24gZWxpZGVkIF0gIAo+IAo+IEkgaGF2ZW4ndCBzZWVuIGEgcmVwbHkgdG8gdGhhdC4K
PiAKPiBBbHNvLCBmcm9tIHRoZSBwYXRjaCB2NToKPiA+IENoYW5nZXMgaW4gdjU6Cj4gPiAgICog
djQgd29ya2VkIG9ubHkgaW4gdGhlIGNhc2Ugb2YgZ3Vlc3RzIGNyZWF0ZWQgdXNpbmcgJ3hsJyBj
b21tYW5kLgo+ID4gICAgIEVuaGFuY2VkIHRoZSBmaXggdG8gd29yayBmb3IgZ3Vlc3RzIGNyZWF0
ZWQgdXNpbmcgbGlidmlydCB0b28uICAKPiAKPiBJJ20gY29uZnVzZWQgYnkgdGhlIHJlc3BvbnNl
cyBpbiB0aGUgdGhyZWFkIHdoaWNoIHJlbGF0ZSB0byBsaWJ2aXJ0Lgo+IElTVE0gdGhhdCBhIGxp
YnZpcnQgcGF0Y2ggaXMgYWxzbyByZXF1aXJlZC4gIERvIHlvdSBtZWFuIHRoYXQgaW4gdjUKPiB0
aGVyZSBpcyBhbHNvIGEgbGlidmlydCBwYXRjaCA/CgogIEhpIElhbiwgdGhlIHBhdGNoIGFzIHBy
b3Bvc2VkIGJyaW5ncyB0aGUgc3BlY2lmaWMgc3VwcG9ydCB0byBsaWJ2aXJ0ZCBieQogIGxpYnZp
cnRkIGRlcGVuZGVuY2llcyB0b3dhcmRzIGxpYnhlbmxpZ2h0Li4uc28gKHNoYXJlZCBvYmplY3Qp
IHdoZW4gWGVuCiAgZHJpdmVyIHVuZGVyIHNwZWNpZmljIHRvb2xzdGFjayBpcyBpbiBlZmZlY3Qu
ICAKClJnZHMsCi0gV2ltIHRlbiBIYXZlLgoKPiBJYW4uCj4gCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4g
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
