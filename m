From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 0/3] gcc-plugins: Introduce stackinit plugin
Date: Tue, 12 Feb 2019 09:54:38 -0800
Message-ID: <CAGXu5j+xz8_wkY2rVRML_iq1o7ZoF1jVp2mi73LjxaKuMNw1cw__19735.507869494$1549994169$gmane$org@mail.gmail.com>
References: <20190123110349.35882-1-keescook@chromium.org>
 <874b8c23-068b-f8e7-2168-12947c06e145@linux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uLSh=QT=chromium.org=keescook@srs-us1.protection.inumbo.net>)
 id 1gtcGl-0007fv-K1
 for xen-devel@lists.xenproject.org; Tue, 12 Feb 2019 17:54:55 +0000
Received: by mail-ua1-x942.google.com with SMTP id n32so1175105uae.7
 for <xen-devel@lists.xenproject.org>; Tue, 12 Feb 2019 09:54:54 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com.
 [209.85.217.45])
 by smtp.gmail.com with ESMTPSA id 32sm6926343ual.12.2019.02.12.09.54.50
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Feb 2019 09:54:51 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id r201so2123720vsc.11
 for <xen-devel@lists.xenproject.org>; Tue, 12 Feb 2019 09:54:50 -0800 (PST)
In-Reply-To: <874b8c23-068b-f8e7-2168-12947c06e145@linux.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexander Popov <alex.popov@linux.com>
Cc: Kernel Hardening <kernel-hardening@lists.openwall.com>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Linux-MM <linux-mm@kvack.org>, William Kucharski <william.kucharski@oracle.com>, dev@openvswitch.org, Edwin Zimmerman <edwin@211mainstreet.net>, linux-kbuild <linux-kbuild@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, intel-wired-lan@lists.osuosl.org, Jeff Kirsher <jeffrey.t.kirsher@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Laura Abbott <labbott@redhat.com>, Jann Horn <jannh@google.com>, intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Network Development <netdev@vger.kernel.org>, linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-security-module <linux-security-module@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, linux-fsdevel
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMjgsIDIwMTkgYXQgNDoxMiBQTSBBbGV4YW5kZXIgUG9wb3YgPGFsZXgucG9w
b3ZAbGludXguY29tPiB3cm90ZToKPgo+IE9uIDIzLjAxLjIwMTkgMTQ6MDMsIEtlZXMgQ29vayB3
cm90ZToKPiA+IFRoaXMgYWRkcyBhIG5ldyBwbHVnaW4gInN0YWNraW5pdCIgdGhhdCBhdHRlbXB0
cyB0byBwZXJmb3JtIHVuY29uZGl0aW9uYWwKPiA+IGluaXRpYWxpemF0aW9uIG9mIGFsbCBzdGFj
ayB2YXJpYWJsZXMKPgo+IEhlbGxvIEtlZXMhIEhlbGxvIGV2ZXJ5b25lIQo+Cj4gSSB3YXMgY3Vy
aW91cyBhYm91dCB0aGUgcGVyZm9ybWFuY2UgaW1wYWN0IG9mIHRoZSBpbml0aWFsaXphdGlvbiBv
ZiBhbGwgc3RhY2sKPiB2YXJpYWJsZXMuIFNvIEkgZGlkIGEgdmVyeSBicmllZiB0ZXN0IHdpdGgg
dGhpcyBwbHVnaW4gb24gdG9wIG9mIDQuMjAuNS4KPgo+IGhhY2tiZW5jaCBvbiBJbnRlbCBDb3Jl
IGk3LTQ3NzAgc2hvd2VkIH4wLjclIHNsb3dkb3duLgo+IGhhY2tiZW5jaCBvbiBLaXJpbiA2MjAg
KEFSTSBDb3J0ZXgtQTUzIE9jdGEtY29yZSAxLjJHSHopIHNob3dlZCB+MS4zJSBzbG93ZG93bi4K
ClRoYW5rcyBmb3IgbG9va2luZyBhdCB0aGlzISBJJ2xsIGJlIGluY2x1ZGluZyBteSBoYWNrYmVu
Y2gKbWVhc3VyZW1lbnRzIGZvciB0aGUgdjIgaGVyZSBpbiBhIG1vbWVudC4KCj4gVGhpcyB0ZXN0
IGludm9sdmVzIHRoZSBrZXJuZWwgc2NoZWR1bGVyIGFuZCBhbGxvY2F0b3IuIEkgY2FuJ3Qgc2F5
IHdoZXRoZXIgdGhleQo+IHVzZSBzdGFjayBhZ2dyZXNzaXZlbHkuIE1heWJlIHBlcmZvcm1hbmNl
IHRlc3RzIG9mIG90aGVyIHN1YnN5c3RlbXMgKGUuZy4KPiBuZXR3b3JrIHN1YnN5c3RlbSkgY2Fu
IHNob3cgZGlmZmVyZW50IG51bWJlcnMuIERpZCB5b3UgdHJ5PwoKSSBoYXZlbid0IGZvdW5kIGEg
c3RhYmxlIG5ldHdvcmsgdGVzdCB5ZXQuIElmIHNvbWVvbmUgY2FuIGZpbmQgYQpyZWFzb25hYmxl
IHdvcmtsb2FkLCBJJ2QgbG92ZSB0byBoZWFyIGFib3V0IGl0LgoKPiBJJ3ZlIGhlYXJkIGEgaHlw
b3RoZXNpcyB0aGF0IHRoZSBpbml0aWFsaXphdGlvbiBvZiBhbGwgc3RhY2sgdmFyaWFibGVzIHdv
dWxkCj4gcG9sbHV0ZSBDUFUgY2FjaGVzLCB3aGljaCBpcyBjcml0aWNhbCBmb3Igc29tZSB0eXBl
cyBvZiBjb21wdXRhdGlvbnMuIE1heWJlIHNvbWUKPiBtaWNyby1iZW5jaG1hcmtzIGNhbiBkaXNw
cm92ZS9jb25maXJtIHRoYXQ/CgpJIGtpbmQgb2YgdGhpbmsgbWljcm8tYmVuY2htYXJrcyBhcmVu
J3Qgc28gdXNlZnVsIGJlY2F1c2UgdGhleSBkb24ndApyZXByZXNlbnQgYSByZWFsLXdvcmxkIHdv
cmtsb2FkLiBJJ3ZlIGhlYXJkIHBlb3BsZSB0YWxrIGFib3V0IFNBUC1IQU5BCmFzIGEgZ29vZCB0
ZXN0LCBidXQgSSBjYW4ndCBnZXQgbXkgaGFuZHMgb24gaXQuIEkgd29uZGVyIGlmIGFueW9uZSBo
YXMKdHJpZWQgIm15c3Fsc2xhcCI/CgotLSAKS2VlcyBDb29rCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
