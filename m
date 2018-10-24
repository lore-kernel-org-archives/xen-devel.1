From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 1/3] sa-init-db: Fix argument parsing
Date: Wed, 24 Oct 2018 11:31:59 +0100
Message-ID: <20181024103201.18681-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=maju=ne=citrix.com=prvs=828bad3c7=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gFGSS-0002fA-JZ
 for xen-devel@lists.xenproject.org; Wed, 24 Oct 2018 10:32:12 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

SXQgY2xhaW1lZCB0byBoYXZlIGEgZGVmYXVsdCBkYiBuYW1lLCBidXQgaXQgZGlkbid0LiAgUmV3
b3JrIHRoZQpvcHRpb24gcGFyc2luZyB0byBtYWtlIHRoZSB1c2FnZSBtZXNzYWdlIHRydWUuICAo
VGhhdCBzYXZlcyBtZSB0eXBpbmcKICBzYS1pbml0LWRiIHN0YW5kYWxvbmUKYW5kIGdldHRpbmcg
Yml6YXJyZSBlcnJvcnMgYXMgc3FsaXRlIHRyaWVzIHRvIHRyZWF0IHRoZSBzaGVsbCBzY3JpcHQK
YHN0YW5kYWxvbmUnIGFzIGlmIGl0IHdlcmUgYSBkYXRhYmFzZSBmaWxlLikKClNpZ25lZC1vZmYt
Ynk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIHNhLWluaXQt
ZGIgfCAxNyArKysrKysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygr
KSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zYS1pbml0LWRiIGIvc2EtaW5pdC1kYgpp
bmRleCBiZDlhYTRhNC4uMmM5N2FhYmEgMTAwNzU1Ci0tLSBhL3NhLWluaXQtZGIKKysrIGIvc2Et
aW5pdC1kYgpAQCAtMTgsMTggKzE4LDE5IEBACiAKIHNldCAtZSAtbyBwb3NpeAogCi11c2FnZSgp
ewotCWNhdCA8PEVORAorYmFkdXNhZ2UoKXsKKwljYXQgPDxFTkQgPiYyCiB1c2FnZTogLi9zYS1p
bml0LWRiIFtkYXRhYmFzZV0KIEVORAorCWV4aXQgMTI3CiB9CiAKLWlmIFsgJCMgLW5lIDEgXSA7
IHRoZW4KLQl1c2FnZSA+JjIKLQlleGl0IDEKLWZpCi0KLWRiPSIkMSIKK2Nhc2UgIiQjLiQqIiBp
bgorMC4pCWRiPXN0YW5kYWxvbmUuZGIJOzsKKzEuLSopCWJhZHVzYWdlCQk7OworMS4qKQlkYj0i
JDEiCQkJOzsKKyopCWJhZHVzYWdlCQk7OworZXNhYwogCiBzcWxpdGUzICIkZGIiIDw8RU5ECiAJ
Q1JFQVRFIFRBQkxFIGZsaWdodHMgKAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
