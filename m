From: Kees Cook <keescook@chromium.org>
Subject: Re: [Intel-gfx] [PATCH 1/3] treewide: Lift switch
 variables out of switches
Date: Thu, 24 Jan 2019 09:36:11 +1300
Message-ID: <CAGXu5jLNvHVhbyr5Cbyoe8o0ARv52sU-NEpD+u2UYfESM3ofCw__38710.2327121951$1548276284$gmane$org@mail.gmail.com>
References: <20190123110349.35882-1-keescook@chromium.org>
 <20190123110349.35882-2-keescook@chromium.org>
 <20190123115829.GA31385@kroah.com> <874l9z31c5.fsf@intel.com>
 <20190123191802.GB15311@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=a/mT=P7=chromium.org=keescook@srs-us1.protection.inumbo.net>)
 id 1gmPMy-0002Fj-5p
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 20:43:32 +0000
Received: by mail-vs1-xe44.google.com with SMTP id b74so2148002vsd.9
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jan 2019 12:43:30 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com.
 [209.85.217.42])
 by smtp.gmail.com with ESMTPSA id y78sm4352230vsc.6.2019.01.23.12.43.29
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Jan 2019 12:43:29 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id h78so2162799vsi.6
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jan 2019 12:43:29 -0800 (PST)
In-Reply-To: <20190123191802.GB15311@bombadil.infradead.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: dev@openvswitch.org, xen-devel <xen-devel@lists.xenproject.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg KH <gregkh@linuxfoundation.org>, intel-gfx@lists.freedesktop.org, linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>, Linux-MM <linux-mm@kvack.org>, linux-security-module <linux-security-module@vger.kernel.org>, intel-wired-lan@lists.osuosl.org, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Network Development <netdev@vger.kernel.org>, Kernel Hardening <kernel-hardening@lists.openwall.com>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, Laura Abbott <labbott@redhat.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, Alexander Popov <alex.popov@linux.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMjQsIDIwMTkgYXQgODoxOCBBTSBNYXR0aGV3IFdpbGNveCA8d2lsbHlAaW5m
cmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIEphbiAyMywgMjAxOSBhdCAwNDoxNzozMFBN
ICswMjAwLCBKYW5pIE5pa3VsYSB3cm90ZToKPiA+IENhbid0IGhhdmU6Cj4gPgo+ID4gICAgICAg
c3dpdGNoIChpKSB7Cj4gPiAgICAgICAgICAgICAgIGludCBqOwo+ID4gICAgICAgY2FzZSAwOgo+
ID4gICAgICAgICAgICAgICAvKiAuLi4gKi8KPiA+ICAgICAgIH0KPiA+Cj4gPiBiZWNhdXNlIGl0
IGNhbid0IGJlIHR1cm5lZCBpbnRvOgo+ID4KPiA+ICAgICAgIHN3aXRjaCAoaSkgewo+ID4gICAg
ICAgICAgICAgICBpbnQgaiA9IDA7IC8qIG5vdCB2YWxpZCBDICovCj4gPiAgICAgICBjYXNlIDA6
Cj4gPiAgICAgICAgICAgICAgIC8qIC4uLiAqLwo+ID4gICAgICAgfQo+ID4KPiA+IGJ1dCBjYW4g
aGF2ZSBlLmcuOgo+ID4KPiA+ICAgICAgIHN3aXRjaCAoaSkgewo+ID4gICAgICAgY2FzZSAwOgo+
ID4gICAgICAgICAgICAgICB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgaW50IGogPSAwOwo+
ID4gICAgICAgICAgICAgICAgICAgICAgIC8qIC4uLiAqLwo+ID4gICAgICAgICAgICAgICB9Cj4g
PiAgICAgICB9Cj4gPgo+ID4gSSB0aGluayBLZWVzJyBhcHByb2FjaCBvZiBtb3Zpbmcgc3VjaCB2
YXJpYWJsZSBkZWNsYXJhdGlvbnMgdG8gdGhlCj4gPiBlbmNsb3NpbmcgYmxvY2sgc2NvcGUgaXMg
YmV0dGVyIHRoYW4gYWRkaW5nIGFub3RoZXIgbmVzdGluZyBibG9jay4KPgo+IEFub3RoZXIgbmVz
dGluZyBsZXZlbCB3b3VsZCBiZSBiYWQsIGJ1dCBJIHRoaW5rIHRoaXMgaXMgT0s6Cj4KPiAgICAg
ICAgIHN3aXRjaCAoaSkgewo+ICAgICAgICAgY2FzZSAwOiB7Cj4gICAgICAgICAgICAgICAgIGlu
dCBqID0gMDsKPiAgICAgICAgICAgICAgICAgLyogLi4uICovCj4gICAgICAgICB9Cj4gICAgICAg
ICBjYXNlIDE6IHsKPiAgICAgICAgICAgICAgICAgdm9pZCAqcCA9IHE7Cj4gICAgICAgICAgICAg
ICAgIC8qIC4uLiAqLwo+ICAgICAgICAgfQo+ICAgICAgICAgfQo+Cj4gSSBjYW4gaW1hZ2luZSBL
ZWVzJyBwYXRjaCBtaWdodCBoYXZlIGEgYmFkIGVmZmVjdCBvbiBzdGFjayBjb25zdW1wdGlvbiwK
PiB1bmxlc3MgR0NDIGNhbiBiZSByZWxpZWQgb24gdG8gYmUgc21hcnQgZW5vdWdoIHRvIG5vdGlj
ZSB0aGUKPiBub24tb3ZlcmxhcHBpbmcgbGl2ZW5lc3Mgb2YgdGhlIHZyaWFibGVzIGFuZCB1c2Ug
dGhlIHNhbWUgc3RhY2sgc2xvdHMKPiBmb3IgYm90aC4KCkdDQyBpcyByZWFzb25hYmxlIGF0IHRo
aXMuIFRoZSBtYWluIGlzc3VlLCB0aG91Z2gsIHdhcyBtb3N0IG9mIHRoZXNlCnBsYWNlcyB3ZXJl
IHVzaW5nIHRoZSB2YXJpYWJsZXMgaW4gbXVsdGlwbGUgY2FzZSBzdGF0ZW1lbnRzLCBzbyB0aGV5
CmNvdWxkbid0IGJlIGxpbWl0ZWQgdG8gYSBzaW5nbGUgYmxvY2sgKG9yIHRoZXknZCBuZWVkIHRv
IGJlIG1hbnVhbGx5CnJlcGVhdGVkIGluIGVhY2ggYmxvY2ssIHdoaWNoIGlzIGV2ZW4gbW9yZSB1
Z2x5LCBJTU8pLgoKV2hhdGV2ZXIgdGhlIGNvbnNlbnN1cywgSSdtIGhhcHB5IHRvIHR3ZWFrIHRo
ZSBwYXRjaC4KClRoYW5rcyEKCi0tIApLZWVzIENvb2sKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
