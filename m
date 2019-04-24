From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] x86/xen: Add "xen_timer_slop" command line
 option
Date: Wed, 24 Apr 2019 14:47:22 -0400
Message-ID: <63b5cb73-ad62-22b3-8df3-da75d4f3e358__7408.93352064944$1556131753$gmane$org@oracle.com>
References: <1553279397-130201-1-git-send-email-ryan.thibodeaux@starlab.io>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=E0+D=S2=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1hJMwB-0000DE-G1
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 18:48:07 +0000
In-Reply-To: <1553279397-130201-1-git-send-email-ryan.thibodeaux@starlab.io>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: thibodux@gmail.com, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: jgross@suse.com, ryan.thibodeaux@starlab.io, tglx@linutronix.de, oleksandr_andrushchenko@epam.com
List-Id: xen-devel@lists.xenproject.org

T24gMy8yMi8xOSAyOjI5IFBNLCB0aGlib2R1eEBnbWFpbC5jb20gd3JvdGU6Cj4gRnJvbTogUnlh
biBUaGlib2RlYXV4IDxyeWFuLnRoaWJvZGVhdXhAc3RhcmxhYi5pbz4KPgo+IEFkZCBhIG5ldyBj
b21tYW5kLWxpbmUgb3B0aW9uICJ4ZW5fdGltZXJfc2xvcD08SU5UPiIgdGhhdCBzZXRzIHRoZQo+
IG1pbmltdW0gZGVsdGEgb2YgdmlydHVhbCBYZW4gdGltZXJzLiBUaGlzIGNvbW1pdCBkb2VzIG5v
dCBjaGFuZ2UgdGhlCj4gZGVmYXVsdCB0aW1lciBzbG9wIHZhbHVlIGZvciB2aXJ0dWFsIFhlbiB0
aW1lcnMuCj4KPiBMb3dlcmluZyB0aGUgdGltZXIgc2xvcCB2YWx1ZSBzaG91bGQgaW1wcm92ZSB0
aGUgYWNjdXJhY3kgb2YgdmlydHVhbAo+IHRpbWVycyAoZS5nLiwgYmV0dGVyIHByb2Nlc3MgZGlz
cGF0Y2ggbGF0ZW5jeSksIGJ1dCBpdCB3aWxsIGxpa2VseQo+IGluY3JlYXNlIHRoZSBudW1iZXIg
b2YgdmlydHVhbCB0aW1lciBpbnRlcnJ1cHRzIChyZWxhdGl2ZSB0byB0aGUKPiBvcmlnaW5hbCBz
bG9wIHNldHRpbmcpLgo+Cj4gVGhlIG9yaWdpbmFsIHRpbWVyIHNsb3AgdmFsdWUgaGFzIG5vdCBj
aGFuZ2VkIHNpbmNlIHRoZSBpbnRyb2R1Y3Rpb24KPiBvZiB0aGUgWGVuLWF3YXJlIExpbnV4IGtl
cm5lbCBjb2RlLiBUaGlzIGNvbW1pdCBwcm92aWRlcyB1c2VycyBhbgo+IG9wcG9ydHVuaXR5IHRv
IHR1bmUgdGltZXIgcGVyZm9ybWFuY2UgZ2l2ZW4gdGhlIHJlZmluZW1lbnRzIHRvCj4gaGFyZHdh
cmUgYW5kIHRoZSBYZW4gZXZlbnQgY2hhbm5lbCBwcm9jZXNzaW5nLiBJdCBhbHNvIG1pcnJvcnMK
PiBhIGZlYXR1cmUgaW4gdGhlIFhlbiBoeXBlcnZpc29yIC0gdGhlICJ0aW1lcl9zbG9wIiBYZW4g
Y29tbWFuZCBsaW5lCj4gb3B0aW9uLgo+Cj4gU2lnbmVkLW9mZi1ieTogUnlhbiBUaGlib2RlYXV4
IDxyeWFuLnRoaWJvZGVhdXhAc3RhcmxhYi5pbz4KCgpBcHBsaWVkIHRvIGZvci1saW51cy01LjIK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
