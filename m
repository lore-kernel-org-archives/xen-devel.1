From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 06/15] xen/arm: introduce
 guest_handle_for_field()
Date: Tue, 8 Jan 2019 14:03:33 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1901081403260.800@sstabellini-ThinkPad-X260>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-7-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TkaK=PQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ggzTF-0005a1-0M
 for xen-devel@lists.xenproject.org; Tue, 08 Jan 2019 22:03:37 +0000
In-Reply-To: <1546846968-7372-7-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Ross Philipson <ross.philipson@gmail.com>, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCA2IEphbiAyMDE5LCBDaHJpc3RvcGhlciBDbGFyayB3cm90ZToKPiBBUk0gcG9ydCBv
ZiBjL3MgYmI1NDQ1ODU6ICJpbnRyb2R1Y2UgZ3Vlc3RfaGFuZGxlX2Zvcl9maWVsZCgpIgo+IAo+
IFRoaXMgaGVscGVyIHR1cm5zIGEgZmllbGQgb2YgYSBHVUVTVF9IQU5ETEUgaW50byBhIEdVRVNU
X0hBTkRMRS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlciBDbGFyayA8Y2hyaXN0b3Bo
ZXIuY2xhcms2QGJhZXN5c3RlbXMuY29tPgo+IFJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBh
dWwuZHVycmFudEBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8
c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCj4gLS0tCj4gIHhlbi9pbmNsdWRlL2FzbS1hcm0vZ3Vl
c3RfYWNjZXNzLmggfCAzICsrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4g
Cj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vZ3Vlc3RfYWNjZXNzLmggYi94ZW4v
aW5jbHVkZS9hc20tYXJtL2d1ZXN0X2FjY2Vzcy5oCj4gaW5kZXggMjI0ZDJhMC4uODk5N2ExYyAx
MDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL2d1ZXN0X2FjY2Vzcy5oCj4gKysrIGIv
eGVuL2luY2x1ZGUvYXNtLWFybS9ndWVzdF9hY2Nlc3MuaAo+IEBAIC02Myw2ICs2Myw5IEBAIGlu
dCBhY2Nlc3NfZ3Vlc3RfbWVtb3J5X2J5X2lwYShzdHJ1Y3QgZG9tYWluICpkLCBwYWRkcl90IGlw
YSwgdm9pZCAqYnVmLAo+ICAgICAgX3k7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCj4gIH0pCj4gIAo+ICsjZGVmaW5lIGd1ZXN0X2hhbmRsZV9m
b3JfZmllbGQoaG5kLCB0eXBlLCBmbGQpICAgICAgICAgIFwKPiArICAgICgoWEVOX0dVRVNUX0hB
TkRMRSh0eXBlKSkgeyAmKGhuZCkucC0+ZmxkIH0pCj4gKwo+ICAjZGVmaW5lIGd1ZXN0X2hhbmRs
ZV9mcm9tX3B0cihwdHIsIHR5cGUpICAgICAgICBcCj4gICAgICAoKFhFTl9HVUVTVF9IQU5ETEVf
UEFSQU0odHlwZSkpIHsgKHR5cGUgKilwdHIgfSkKPiAgI2RlZmluZSBjb25zdF9ndWVzdF9oYW5k
bGVfZnJvbV9wdHIocHRyLCB0eXBlKSAgXAo+IC0tIAo+IDIuNy40Cj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
