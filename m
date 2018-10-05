From: Oscar Salvador <osalvador@techadventures.net>
Subject: Re: [PATCH v3 6/6] memory-hotplug.txt: Add some details
 about locking internals
Date: Fri, 5 Oct 2018 09:08:47 +0200
Message-ID: <20181005070847.GB27754__48856.7379922189$1538723251$gmane$org@techadventures.net>
References: <20180927092554.13567-1-david@redhat.com>
 <20180927092554.13567-7-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8npz=mr=gmail.com=osalvador.vilardaga@srs-us1.protection.inumbo.net>)
 id 1g8KEE-0008Kp-KN
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 07:08:50 +0000
Received: by mail-wr1-f67.google.com with SMTP id g15-v6so9759788wru.9
 for <xen-devel@lists.xenproject.org>; Fri, 05 Oct 2018 00:08:49 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20180927092554.13567-7-david@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Michal Hocko <mhocko@suse.com>, linux-acpi@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, devel@linuxdriverproject.org, xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBTZXAgMjcsIDIwMTggYXQgMTE6MjU6NTRBTSArMDIwMCwgRGF2aWQgSGlsZGVuYnJh
bmQgd3JvdGU6Cj4gQ2M6IEpvbmF0aGFuIENvcmJldCA8Y29yYmV0QGx3bi5uZXQ+Cj4gQ2M6IE1p
Y2hhbCBIb2NrbyA8bWhvY2tvQHN1c2UuY29tPgo+IENjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxp
bnV4LWZvdW5kYXRpb24ub3JnPgo+IFJldmlld2VkLWJ5OiBQYXZlbCBUYXRhc2hpbiA8cGF2ZWwu
dGF0YXNoaW5AbWljcm9zb2Z0LmNvbT4KPiBSZXZpZXdlZC1ieTogUmFzaG1pY2EgR3VwdGEgPHJh
c2htaWNhLmdAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IERhdmlkIEhpbGRlbmJyYW5kIDxk
YXZpZEByZWRoYXQuY29tPgoKUmV2aWV3ZWQtYnk6IE9zY2FyIFNhbHZhZG9yIDxvc2FsdmFkb3JA
c3VzZS5kZT4KCi0tIApPc2NhciBTYWx2YWRvcgpTVVNFIEwzCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
