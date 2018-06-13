From: Balbir Singh <bsingharora@gmail.com>
Subject: Re: [RFC PATCH 01/12] xen/manage: keep track of the
 on-going suspend mode
Date: Thu, 14 Jun 2018 02:42:16 +1000
Message-ID: <CAKTCnz=Lfy2vpfGs4+_N9Q9_QCxt5XjFFTEsArkCaKvAi70H_g__46659.9871208475$1528914122$gmane$org@mail.gmail.com>
References: <20180612205619.28156-1-anchalag@amazon.com>
 <20180612205619.28156-2-anchalag@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mnd2=i7=gmail.com=bsingharora@srs-us1.protection.inumbo.net>)
 id 1fT8qh-00012y-VT
 for xen-devel@lists.xenproject.org; Wed, 13 Jun 2018 16:42:20 +0000
Received: by mail-ua0-x243.google.com with SMTP id c23-v6so2166754uan.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Jun 2018 09:42:18 -0700 (PDT)
In-Reply-To: <20180612205619.28156-2-anchalag@amazon.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anchal Agarwal <anchalag@amazon.com>
Cc: jgross@suse.com, Len Brown <len.brown@intel.com>, kamatam@amazon.com, eduval@amazon.com, vallish@amazon.com, netdev <netdev@vger.kernel.org>, Frank van der Linden <fllinden@amazon.com>, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, guruanb@amazon.com, cyberax@amazon.com, Ingo Molnar <mingo@redhat.com>, Pavel Machek <pavel@ucw.cz>, "H. Peter Anvin" <hpa@zytor.com>, linux-pm@vger.kernel.org, xen-devel <xen-devel@lists.xenproject.org>, boris.ostrovsky@oracle.com, Thomas Gleixner <tglx@linutronix.de>, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdW4gMTMsIDIwMTggYXQgNjo1NiBBTSwgQW5jaGFsIEFnYXJ3YWwgPGFuY2hhbGFn
QGFtYXpvbi5jb20+IHdyb3RlOgo+IEZyb206IE11bmVoaXNhIEthbWF0YSA8a2FtYXRhbUBhbWF6
b24uY29tPgo+Cj4gVG8gZGlmZmVyZW50aWF0ZSBiZXR3ZWVuIFhlbiBzdXNwZW5kLCBQTSBzdXNw
ZW5kIGFuZCBQTSBoaWJlcm5hdGlvbiwKPiBrZWVwIHRyYWNrIG9mIHRoZSBvbi1nb2luZyBzdXNw
ZW5kIG1vZGUgYnkgbWFpbmx5IHVzaW5nIGEgbmV3IFBNCj4gbm90aWZpZXIuIFNpbmNlIFhlbiBz
dXNwZW5kIGRvZXNuJ3QgaGF2ZSBjb3JyZXNwb25kaW5nIFBNIGV2ZW50LCBpdHMKPiBtYWluIGxv
Z2ljIGlzIG1vZGZpZWQgdG8gYWNxdWlyZSBwbV9tdXRleCBhbmQgc2V0IHRoZSBjdXJyZW50IG1v
ZGUuCj4KCldoeSBkbyB3ZSBuZWVkIHRvIGRpZmZlcmVudGlhdGUgYmV0d2VlbiB0aGVtPyBUaGUg
Y2hhbmdlbG9nIGRvZXMgbm90CmV4cGxhaW4gaG93IFhlbiBTdXNwZW5kIGlzIGRpZmZlcmVudCBm
cm9tIFBNIHN1c3BlbmQuIFRoZSBkaWZmZXJlbmNlCmNvdWxkIGJlIHdoYXQgaXMgaW5qZWN0ZWQg
aW50byB0aGUgZ3Vlc3QgdnMgd2hhdCB0aGUgZ3Vlc3QgZGVjaWRlcyB0bwpkby4gSG93IGRvIHdl
IHVzZSB0aGUgbmV3IHN1c3BlbmRfbW9kZT8KCj4gTm90ZSB0aGF0IHdlIG1heSBzZWUgZGVhZGxv
Y2sgaWYgUE0gc3VzcGVuZC9oaWJlcm5hdGlvbiBpcyBpbnRlcnJ1cHRlZAo+IGJ5IFhlbiBzdXNw
ZW5kLiBQTSBzdXNwZW5kL2hpYmVybmF0aW9uIGRlcGVuZHMgb24geGVud2F0Y2ggdGhyZWFkIHRv
Cj4gcHJvY2VzcyB4ZW5idXMgc3RhdGUgdHJhbnNhY3Rpb25zLCBidXQgdGhlIHRocmVhZCB3aWxs
IHNsZWVwIHRvIHdhaXQKPiBwbV9tdXRleCB3aGljaCBpcyBhbHJlYWR5IGhlbGQgYnkgUE0gc3Vz
cGVuZC9oaWJlcm5hdGlvbiBjb250ZXh0IGluIHRoZQo+IHNjZW5hcmlvLiBUaG91Z2gsIGFjcXVp
cm5nIHBtX211dGV4IGlzIHN0aWxsIHJpZ2h0IHRoaW5nIHRvIGRvLCBhbmQgd2UKPiB3b3VsZCBu
ZWVkIHRvIG1vZGlmeSBYZW4gc2h1dGRvd24gY29kZSB0byBhdm9pZCB0aGUgaXNzdWUuIFRoaXMg
d2lsbCBiZQo+IGZpeGVkIGJ5IGEgc2VwYXJhdGUgcGF0Y2guCj4KPiBTaWduZWQtb2ZmLWJ5OiBN
dW5laGlzYSBLYW1hdGEgPGthbWF0YW1AYW1hem9uLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbmNo
YWwgQWdhcndhbCA8YW5jaGFsYWdAYW1hem9uLmNvbT4KPiBSZXZpZXdlZC1ieTogU2ViYXN0aWFu
IEJpZW11ZWxsZXIgPHNiaWVtdWVAYW1hem9uLmNvbT4KPiBSZXZpZXdlZC1ieTogTXVuZWhpc2Eg
S2FtYXRhIDxrYW1hdGFtQGFtYXpvbi5jb20+Cj4gUmV2aWV3ZWQtYnk6IEVkdWFyZG8gVmFsZW50
aW4gPGVkdXZhbEBhbWF6b24uY29tPgo+IC0tLQo+ICBkcml2ZXJzL3hlbi9tYW5hZ2UuYyB8IDU4
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDU4IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3hlbi9tYW5hZ2UuYyBiL2RyaXZlcnMveGVuL21hbmFnZS5jCj4gaW5kZXggODgzNTA2NS4uOGY5
ZWE4NyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3hlbi9tYW5hZ2UuYwo+ICsrKyBiL2RyaXZlcnMv
eGVuL21hbmFnZS5jCj4gQEAgLTEzLDYgKzEzLDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L2ZyZWV6
ZXIuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3N5c2NvcmVfb3BzLmg+Cj4gICNpbmNsdWRlIDxsaW51
eC9leHBvcnQuaD4KPiArI2luY2x1ZGUgPGxpbnV4L3N1c3BlbmQuaD4KPgo+ICAjaW5jbHVkZSA8
eGVuL3hlbi5oPgo+ICAjaW5jbHVkZSA8eGVuL3hlbmJ1cy5oPgo+IEBAIC0zOSw2ICs0MCwxNiBA
QCBlbnVtIHNodXRkb3duX3N0YXRlIHsKPiAgLyogSWdub3JlIG11bHRpcGxlIHNodXRkb3duIHJl
cXVlc3RzLiAqLwo+ICBzdGF0aWMgZW51bSBzaHV0ZG93bl9zdGF0ZSBzaHV0dGluZ19kb3duID0g
U0hVVERPV05fSU5WQUxJRDsKPgo+ICtlbnVtIHN1c3BlbmRfbW9kZXMgewo+ICsgICAgICAgTk9f
U1VTUEVORCA9IDAsCj4gKyAgICAgICBYRU5fU1VTUEVORCwKPiArICAgICAgIFBNX1NVU1BFTkQs
Cj4gKyAgICAgICBQTV9ISUJFUk5BVElPTiwKPiArfTsKCgpXaHkgZG8gdGhlIGVudW1zIHJhbmdl
IGFjcm9zcyBuYW1lc3BhY2VzIC0tIGJldHdlZW4gTk8sIFhFTiBhbmQgUE0/CkNhbiB3ZSBwbGVh
c2UgYmUgY29uc2lzdGVudCBYRU5fV0FUQ0hfU1VTUEVORCwgWEVOX1BNX1NVU1BFTkQuIGV0Yz8K
CkJhbGJpciBTaW5naC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
