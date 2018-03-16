From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH v2 2/3] sndif: Add explicit back and front
 synchronization
Date: Fri, 16 Mar 2018 08:24:41 +0200
Message-ID: <7752ee92-8f43-03be-5e64-702794af0f8d__35351.4550407$1521181421$gmane$org@gmail.com>
References: <1521043365-26813-1-git-send-email-andr2000@gmail.com>
 <1521043365-26813-3-git-send-email-andr2000@gmail.com>
 <20180315201724.GN10870@char.us.oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=6j7i=gg=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1ewinG-0001Mp-74
 for xen-devel@lists.xenproject.org; Fri, 16 Mar 2018 06:24:46 +0000
Received: by mail-lf0-x244.google.com with SMTP id w16-v6so13644033lfc.13
 for <xen-devel@lists.xenproject.org>; Thu, 15 Mar 2018 23:24:44 -0700 (PDT)
In-Reply-To: <20180315201724.GN10870@char.us.oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: alsa-devel@alsa-project.org, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, tiwai@suse.de, Clemens Ladisch <clemens@ladisch.de>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, Oleksandr Grytsov <oleksandr_grytsov@epam.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMTUvMjAxOCAxMDoxNyBQTSwgS29ucmFkIFJ6ZXN6dXRlayBXaWxrIHdyb3RlOgo+PiAr
ICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKgo+PiArICogICAgICAgICAgICAgICAgICAgICAgICBCYWNr
IHRvIGZyb250IGV2ZW50cyBkZWxpdmVyeQo+PiArICoqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgo+PiAr
ICogSW4gb3JkZXIgdG8gZGVsaXZlciBhc3luY2hyb25vdXMgZXZlbnRzIGZyb20gYmFjayB0byBm
cm9udCBhIHNoYXJlZCBwYWdlIGlzCj4+ICsgKiBhbGxvY2F0ZWQgYnkgZnJvbnQgYW5kIGl0cyBn
cmFudGVkIHJlZmVyZW5jZSBwcm9wYWdhdGVkIHRvIGJhY2sgdmlhCj4+ICsgKiBYZW5TdG9yZSBl
bnRyaWVzIChldnQtcmluZy1yZWYvZXZ0LWV2ZW50LWNoYW5uZWwpLgo+PiArICogVGhpcyBwYWdl
IGhhcyBhIGNvbW1vbiBoZWFkZXIgdXNlZCBieSBib3RoIGZyb250IGFuZCBiYWNrIHRvIHN5bmNo
cm9uaXplCj4+ICsgKiBhY2Nlc3MgYW5kIGNvbnRyb2wgZXZlbnQncyByaW5nIGJ1ZmZlciwgd2hp
bGUgYmFjayBiZWluZyBhIHByb2R1Y2VyIG9mIHRoZQo+PiArICogZXZlbnRzIGFuZCBmcm9udCBi
ZWluZyBhIGNvbnN1bWVyLiBUaGUgcmVzdCBvZiB0aGUgcGFnZSBhZnRlciB0aGUgaGVhZGVyCj4+
ICsgKiBpcyB1c2VkIGZvciBldmVudCBwYWNrZXRzLgo+PiArICoKPj4gKyAqIFVwb24gcmVjZXB0
aW9uIG9mIGFuIGV2ZW50KHMpIGZyb250IG1heSBjb25maXJtIGl0cyByZWNlcHRpb24KPj4gKyAq
IGZvciBlaXRoZXIgZWFjaCBldmVudCwgZ3JvdXAgb2YgZXZlbnRzIG9yIG5vbmUuCj4+ICsgKi8K
Pj4gKwo+PiArc3RydWN0IHhlbnNuZF9ldmVudF9wYWdlIHsKPj4gKyAgICB1aW50MzJfdCBpbl9j
b25zOwo+PiArICAgIHVpbnQzMl90IGluX3Byb2Q7Cj4+ICsgICAgdWludDhfdCByZXNlcnZlZFsy
NF07Cj4gQ291bGQgdGhpcyBiZSBhbGlnbmVkIGF0IDY0IGJ5dGVzPwpTdXJlLCB3aWxsIG1ha2Ug
dGhlIHN0cnVjdCA2NCBieXRlcwo+PiArfTsKPj4gKwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
