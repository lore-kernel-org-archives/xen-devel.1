From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH v6 06/15] xen/arm: introduce
 guest_handle_for_field()
Date: Wed, 23 Jan 2019 18:04:54 -0800
Message-ID: <1548295503-15946-7-git-send-email-christopher.w.clark@gmail.com>
References: <1548295503-15946-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ulBm=QA=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gmUOd-0003yZ-TI
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 02:05:35 +0000
Received: by mail-it1-x144.google.com with SMTP id c9so2204850itj.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jan 2019 18:05:35 -0800 (PST)
In-Reply-To: <1548295503-15946-1-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QVJNIHBvcnQgb2YgYy9zIGJiNTQ0NTg1OiAiaW50cm9kdWNlIGd1ZXN0X2hhbmRsZV9mb3JfZmll
bGQoKSIKClRoaXMgaGVscGVyIHR1cm5zIGEgZmllbGQgb2YgYSBHVUVTVF9IQU5ETEUgaW50byBh
IEdVRVNUX0hBTkRMRS4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waGVyIENsYXJrIDxjaHJpc3Rv
cGhlci5jbGFyazZAYmFlc3lzdGVtcy5jb20+ClJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBh
dWwuZHVycmFudEBjaXRyaXguY29tPgpSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPgo9PT0KdjM6IEFkZGVkIFN0ZWZhbm8ncyBSZXZpZXdlZC1i
eQp2MjogQWRkZWQgUGF1bCdzIFJldmlld2VkLWJ5Ci0tLQogeGVuL2luY2x1ZGUvYXNtLWFybS9n
dWVzdF9hY2Nlc3MuaCB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9ndWVzdF9hY2Nlc3MuaCBiL3hlbi9pbmNs
dWRlL2FzbS1hcm0vZ3Vlc3RfYWNjZXNzLmgKaW5kZXggMjI0ZDJhMC4uODk5N2ExYyAxMDA2NDQK
LS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9ndWVzdF9hY2Nlc3MuaAorKysgYi94ZW4vaW5jbHVk
ZS9hc20tYXJtL2d1ZXN0X2FjY2Vzcy5oCkBAIC02Myw2ICs2Myw5IEBAIGludCBhY2Nlc3NfZ3Vl
c3RfbWVtb3J5X2J5X2lwYShzdHJ1Y3QgZG9tYWluICpkLCBwYWRkcl90IGlwYSwgdm9pZCAqYnVm
LAogICAgIF95OyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXAogfSkKIAorI2RlZmluZSBndWVzdF9oYW5kbGVfZm9yX2ZpZWxkKGhuZCwgdHlwZSwg
ZmxkKSAgICAgICAgICBcCisgICAgKChYRU5fR1VFU1RfSEFORExFKHR5cGUpKSB7ICYoaG5kKS5w
LT5mbGQgfSkKKwogI2RlZmluZSBndWVzdF9oYW5kbGVfZnJvbV9wdHIocHRyLCB0eXBlKSAgICAg
ICAgXAogICAgICgoWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh0eXBlKSkgeyAodHlwZSAqKXB0ciB9
KQogI2RlZmluZSBjb25zdF9ndWVzdF9oYW5kbGVfZnJvbV9wdHIocHRyLCB0eXBlKSAgXAotLSAK
Mi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
