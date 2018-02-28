From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 2/2] xen: events: free irqs in error
	condition
Date: Wed, 28 Feb 2018 08:16:23 +0000
Message-ID: <20180228081623.umnyv4w67h2rsrwk__30632.8763174408$1519805736$gmane$org@MacBook-Pro-de-Roger.local>
References: <1519746958-52077-1-git-send-email-aams@amazon.com>
 <1519746958-52077-3-git-send-email-aams@amazon.com>
 <20180227170740.jcaxsvpepsn6eot2@MacBook-Pro-de-Roger.local>
 <1519752774.4965.23.camel@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=j/eq=fw=citrix.com=prvs=5902857c7=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eqwuj-0002Ld-5N
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2018 08:16:37 +0000
Content-Disposition: inline
In-Reply-To: <1519752774.4965.23.camel@amazon.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Shah, Amit" <aams@amazon.de>
Cc: "jgross@suse.com" <jgross@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "anoob.soman@citrix.com" <anoob.soman@citrix.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, "shuo.a.liu@intel.com" <shuo.a.liu@intel.com>, "Valentin,
 Eduardo" <eduval@lab126.com>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, "kys@microsoft.com" <kys@microsoft.com>, "tglx@linutronix.de" <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBGZWIgMjcsIDIwMTggYXQgMDU6MzI6NTNQTSArMDAwMCwgU2hhaCwgQW1pdCB3cm90
ZToKPiAKPiBPbiBEaSwgMjAxOC0wMi0yNyBhdCAxNzowNyArMDAwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiA+IE9uIFR1ZSwgRmViIDI3LCAyMDE4IGF0IDAzOjU1OjU4UE0gKzAwMDAsIEFt
aXQgU2hhaCB3cm90ZToKPiA+ID4gCj4gPiA+IEluIGNhc2Ugb2YgZXJyb3JzIGluIGlycSBzZXR1
cCBmb3IgTVNJLCBmcmVlIHVwIHRoZSBhbGxvY2F0ZWQgaXJxcy4KPiA+ID4gCj4gPiA+IEZpeGVz
OiA0ODkyYzliNGFkYTlmOSAoInhlbjogYWRkIHN1cHBvcnQgZm9yIE1TSSBtZXNzYWdlIGdyb3Vw
cyIpCj4gPiA+IFJlcG9ydGVkLWJ5OiBIb29tYW4gTWlyaGFkaSA8bWlyaGFkaWhAYW1hem9uLmNv
bT4KPiA+ID4gQ0M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPgo+ID4gPiBDQzogUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiA+IENDOiBCb3JpcyBPc3Ryb3Zza3kg
PGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgo+ID4gPiBDQzogRWR1YXJkbyBWYWxlbnRpbiA8
ZWR1dmFsQGFtYXpvbi5jb20+Cj4gPiA+IENDOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+Cj4gPiA+IENDOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KPiA+ID4g
Q0M6ICJLLiBZLiBTcmluaXZhc2FuIiA8a3lzQG1pY3Jvc29mdC5jb20+Cj4gPiA+IENDOiBMaXUg
U2h1byA8c2h1by5hLmxpdUBpbnRlbC5jb20+Cj4gPiA+IENDOiBBbm9vYiBTb21hbiA8YW5vb2Iu
c29tYW5AY2l0cml4LmNvbT4KPiA+ID4gU2lnbmVkLW9mZi1ieTogQW1pdCBTaGFoIDxhYW1zQGFt
YXpvbi5jb20+Cj4gPiA+IC0tLQo+ID4gPiDCoGRyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFz
ZS5jIHwgNSArKysrLQo+ID4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9ldmVudHMv
ZXZlbnRzX2Jhc2UuYwo+ID4gPiBiL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jCj4g
PiA+IGluZGV4IGM4NmQxMGUuLmEyOTk1ODYgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMveGVu
L2V2ZW50cy9ldmVudHNfYmFzZS5jCj4gPiA+ICsrKyBiL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVu
dHNfYmFzZS5jCj4gPiA+IEBAIC03NTAsMTEgKzc1MCwxNCBAQCBpbnQgeGVuX2JpbmRfcGlycV9t
c2lfdG9faXJxKHN0cnVjdCBwY2lfZGV2Cj4gPiA+ICpkZXYsIHN0cnVjdCBtc2lfZGVzYyAqbXNp
ZGVzYywKPiA+ID4gwqAKPiA+ID4gwqAJcmV0ID0gaXJxX3NldF9tc2lfZGVzYyhpcnEsIG1zaWRl
c2MpOwo+ID4gPiDCoAlpZiAocmV0IDwgMCkKPiA+ID4gLQkJZ290byBlcnJvcl9pcnE7Cj4gPiA+
ICsJCWdvdG8gZXJyb3JfZGVzYzsKPiA+ID4gwqBvdXQ6Cj4gPiA+IMKgCW11dGV4X3VubG9jaygm
aXJxX21hcHBpbmdfdXBkYXRlX2xvY2spOwo+ID4gPiDCoAlyZXR1cm4gaXJxOwo+ID4gPiDCoGVy
cm9yX2lycToKPiA+ID4gKwl3aGlsZSAoLS1udmVjID49IGkpCj4gPiA+ICsJCXhlbl9mcmVlX2ly
cShpcnEgKyBudmVjKTsKPiA+ID4gK2Vycm9yX2Rlc2M6Cj4gPiA+IMKgCXdoaWxlIChpID4gMCkg
ewo+ID4gPiDCoAkJaS0tOwo+ID4gPiDCoAkJX191bmJpbmRfZnJvbV9pcnEoaXJxICsgaSk7Cj4g
PiBJdCBzZWVtcyBwb2ludGxlc3MgdG8gaW50cm9kdWNlIGFub3RoZXIgbGFiZWwgYW5kIGFub3Ro
ZXIgbG9vcCB0byBmaXgKPiA+IHNvbWV0aGluZyB0aGF0IGNhbiBiZSBmaXhlZCB3aXRoIGEgc2lu
Z2xlIGxhYmVsIGFuZCBhIHNpbmdsZSBsb29wLAo+ID4gdGhpcyBqdXN0IG1ha2VzIHRoZSBjb2Rl
IG1vcmUgY29tcGxleCBmb3Igbm8gcmVhc29uLgo+IAo+IEkgZGlzYWdyZWUsIGp1c3QgYmVjYXVz
ZSB0aGVyZSBhcmUgdHdvIGRpZmZlcmVudCBjbGVhbnVwcyB0byBiZSBtYWRlCj4gZm9yIHR3byBk
aWZmZXJlbnQgaXNzdWVzOyBpdCdzIG5vdCBhcyBpZiB0aGUgaWYuLiBhbmQgZWxzZSBjb25kaXRp
b25zCj4gYXJlIGdvaW5nIHRvIGJlIGludGVybGVhdmVkLgoKT2gsIEkgZG9uJ3QgbWluZCBzbyBt
dWNoIHdoZXRoZXIgaXQgZW5kcyB1cCBiZWluZyB0d28gcGF0Y2hlcyBvciBhCnNpbmdsZSBvbmUs
IGJ1dCBJTUhPIHRoZSBjb2RlIHNob3VsZCBlbmQgdXAgbG9va2luZyBzaW1pbGFyIHRvIHdoYXQg
SQpwcm9wb3NlZCwgSSB3b3VsZCBsaWtlIHRvIGF2b2lkIGhhdmluZyB0d28gbG9vcHMgYW5kIHR3
byBsYWJlbHMuCgpDb3VsZCB5b3UgcmV3b3JrIHRoZSBzZXJpZXMgc28gdGhhdCB0aGUgZW5kIHJl
c3VsdCB1c2VzIGEgc2luZ2xlIGxvb3AKKGFuZCBsYWJlbCk/CgpUaGFua3MsIFJvZ2VyLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
