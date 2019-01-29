From: Alexander Popov <alex.popov@linux.com>
Subject: Re: [PATCH 0/3] gcc-plugins: Introduce stackinit plugin
Date: Tue, 29 Jan 2019 03:12:24 +0300
Message-ID: <874b8c23-068b-f8e7-2168-12947c06e145__45777.7014163852$1548741776$gmane$org@linux.com>
References: <20190123110349.35882-1-keescook@chromium.org>
Reply-To: alex.popov@linux.com
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HQ1M=QF=gmail.com=a13xp0p0v88@srs-us1.protection.inumbo.net>)
 id 1goH0w-0001Wl-Jy
 for xen-devel@lists.xenproject.org; Tue, 29 Jan 2019 00:12:30 +0000
Received: by mail-lj1-f195.google.com with SMTP id t18-v6so15915099ljd.4
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jan 2019 16:12:28 -0800 (PST)
In-Reply-To: <20190123110349.35882-1-keescook@chromium.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org
Cc: dev@openvswitch.org, Matthew Wilcox <willy@infradead.org>, William Kucharski <william.kucharski@oracle.com>, Jann Horn <jannh@google.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, netdev@vger.kernel.org, intel-gfx@lists.freedesktop.org, linux-usb@vger.kernel.org, Jeff Kirsher <jeffrey.t.kirsher@intel.com>, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, linux-security-module@vger.kernel.org, kernel-hardening@lists.openwall.com, intel-wired-lan@lists.osuosl.org, Jani Nikula <jani.nikula@linux.intel.com>, Greg KH <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org, xen-devel@lists.xenproject.org, Laura Abbott <labbott@redhat.com>, linux-kbuild@vger.kernel.org, Edwin Zimmerman <edwin@211mainstreet.net>
List-Id: xen-devel@lists.xenproject.org

T24gMjMuMDEuMjAxOSAxNDowMywgS2VlcyBDb29rIHdyb3RlOgo+IFRoaXMgYWRkcyBhIG5ldyBw
bHVnaW4gInN0YWNraW5pdCIgdGhhdCBhdHRlbXB0cyB0byBwZXJmb3JtIHVuY29uZGl0aW9uYWwK
PiBpbml0aWFsaXphdGlvbiBvZiBhbGwgc3RhY2sgdmFyaWFibGVzCgpIZWxsbyBLZWVzISBIZWxs
byBldmVyeW9uZSEKCkkgd2FzIGN1cmlvdXMgYWJvdXQgdGhlIHBlcmZvcm1hbmNlIGltcGFjdCBv
ZiB0aGUgaW5pdGlhbGl6YXRpb24gb2YgYWxsIHN0YWNrCnZhcmlhYmxlcy4gU28gSSBkaWQgYSB2
ZXJ5IGJyaWVmIHRlc3Qgd2l0aCB0aGlzIHBsdWdpbiBvbiB0b3Agb2YgNC4yMC41LgoKaGFja2Jl
bmNoIG9uIEludGVsIENvcmUgaTctNDc3MCBzaG93ZWQgfjAuNyUgc2xvd2Rvd24uCmhhY2tiZW5j
aCBvbiBLaXJpbiA2MjAgKEFSTSBDb3J0ZXgtQTUzIE9jdGEtY29yZSAxLjJHSHopIHNob3dlZCB+
MS4zJSBzbG93ZG93bi4KClRoaXMgdGVzdCBpbnZvbHZlcyB0aGUga2VybmVsIHNjaGVkdWxlciBh
bmQgYWxsb2NhdG9yLiBJIGNhbid0IHNheSB3aGV0aGVyIHRoZXkKdXNlIHN0YWNrIGFnZ3Jlc3Np
dmVseS4gTWF5YmUgcGVyZm9ybWFuY2UgdGVzdHMgb2Ygb3RoZXIgc3Vic3lzdGVtcyAoZS5nLgpu
ZXR3b3JrIHN1YnN5c3RlbSkgY2FuIHNob3cgZGlmZmVyZW50IG51bWJlcnMuIERpZCB5b3UgdHJ5
PwoKSSd2ZSBoZWFyZCBhIGh5cG90aGVzaXMgdGhhdCB0aGUgaW5pdGlhbGl6YXRpb24gb2YgYWxs
IHN0YWNrIHZhcmlhYmxlcyB3b3VsZApwb2xsdXRlIENQVSBjYWNoZXMsIHdoaWNoIGlzIGNyaXRp
Y2FsIGZvciBzb21lIHR5cGVzIG9mIGNvbXB1dGF0aW9ucy4gTWF5YmUgc29tZQptaWNyby1iZW5j
aG1hcmtzIGNhbiBkaXNwcm92ZS9jb25maXJtIHRoYXQ/CgpUaGFua3MhCkJlc3QgcmVnYXJkcywK
QWxleGFuZGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
